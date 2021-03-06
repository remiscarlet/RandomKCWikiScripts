local p = {}

-- checks if data is in the array as a key
function valid(data, array)
    local valid = {}
    for i = 1, #array do
        valid[array[i]] = true
    end
    if valid[data] then
        return true
    else
        return false
    end
end

-- returns a string representation of a table.
-- cannot do recursive tables. Eg, only single dimensional tables will work
-- should a multi-dimensional table be given, it will simply put "table" as the value
function table.dictConcat(dict,sep)
    if sep == nil then sep = " | " end
    local final = ""
    for k,v in pairs(dict) do
        if k ~= nil then
            if v ~= nil then
                final = final .. k .. "=" .. tostring(v) .. sep 
            else
                final = final .. k .. "= nil" .. sep
            end
        else
            if v ~= nil then
                final = final .. tostring(v) .. sep 
            else
                final = final .. "nil" .. sep
            end
        end
    end
    return final
end

-- takes a string and returns string with first letter capitalized
function capitalize(str)
    return (str:gsub("^%l", string.upper))
end

-- "info" should be higher level table of information with eg 
-- {["A"] = {["1"] = {["xp"]="120", ["main_info"] = "ta-class etc"}
--           ["2"] = {["xp"]="150", etc}
--          },
--  ["B"] = etc etc
-- }
-- "headers" should be a table with which params are used
-- "bossNode" should be a single char with which node is the boss node
function p.renderEncounterTable(info,headers, bossNode)
    function getRowSize(table, recurse)
        if recurse == nil then recurse = false end
        local size = 0
        for k,v in pairs(table) do
            if type(v) == "table" and recurse then
                size = size+getRowSize(v)
            elseif v ~= "" then
                size = size+1
            end
        end
        return size
    end
    local root = mw.html.create("table")
    root:addClass("wikitable")
    local body = mw.html.create("tbody")
    local headerRow = mw.html.create("tr")
    local th = mw.html.create("th")
    th:wikitext("Node")
    headerRow:node(th)
    local paramOrder = {"Xp","Lv","Node Info","Form","Air Parity","Air Superiority"}
    for i,param in pairs(paramOrder) do
        if headers[param] then
            th = mw.html.create("th")
            th:wikitext(param)
            headerRow:node(th)
        end
    end
    body:node(headerRow)
    for nodeLetter,values in pairs(info) do
        if values ~= nil then
            local firstRow = mw.html.create("tr")
            local firstCol = mw.html.create("td")
            firstCol
                    :wikitext(nodeLetter)
                    :css("text-align","center")
                    :attr("rowspan",tostring(getRowSize(values)))
            if nodeLetter == bossNode then
                firstCol:css("color","red")
                firstCol:css("font-weight","bold")
            end
            firstRow:node(firstCol)
            -- since first row with rowspan is handled differently, just
            -- do it separately
            if type(values[1]) == "table" then
                for _,param in pairs(paramOrder) do
                    if headers[param] then
                        local col = mw.html.create("td")
                        if values[1][param] ~= nil then
                            col
                                :wikitext(values[1][param])
                                :css("text-align","center")
                        end
                        firstRow:node(col)
                    end
                end
            end
            body:node(firstRow)
            -- Keep note that values is the table of node A
            -- Eg, {["1"]={
            --              ["xp"] = "",
            --              ["lv"] = "" etc
            --          },
            --      ["2"]={
            --              ["xp"] = "", etc
            --          }
            --      }   
            for i=2,#values do
                if type(values[i]) == "table" then
                    local row = mw.html.create("tr")
                    for _,param in pairs(paramOrder) do
                        if headers[param] then
                            local col = mw.html.create("td")
                            local temp = values[i]
                            temp = temp[param]
                            if values[i][param] ~= nil then
                                local text = values[i][param]
                                col 
                                    :wikitext(p.replaceWordWithWikicode(text))
                                    :css("text-align","center")
                            end
                            row:node(col)
                        end
                    end
                    body:node(row)
                end
            end

        end
    end
    root:node(body)
    return tostring(root) .. "AAAAA<br>" .. mw.text.nowiki(tostring(root))
end

function p.encounterTemplate(frame)
    local bossNode = ""
    local mapEncounterTable = {}
    -- get list of params that are used, eg maybe none of the nodes have air_parity info. 
    -- In that case, don't bother adding column for it in the final html table
    local usedParams = {["Xp"] = false,
                        ["Lv"] = false,
                        ["Node Info"] = false,
                        ["Form"] = false,
                        ["Air Parity"] = false,
                        ["Air Superiority"] =false}
    local validNodeLetters = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
    -- map all the nodes we'll be using into mapEncounterTable -> {"A":true,"B"=true} etc
    for k,v in pairs(frame.args) do
        for i,letter in pairs(validNodeLetters) do
            if valid(letter,mw.text.split(mw.text.split(k,"_")[1],"")) then
                mapEncounterTable[letter] = {}
                if letter>bossNode then
                    bossNode = letter
                end
            end
        end
    end
    if frame.args["boss"]~=nil and bossNode ~= frame.args["boss"] then
        bossNode = frame.args["boss"]
    end

    -- mapping node information to 
    -- nodePattern should be like A1_xp, B3_lv, C1_form or something
    for nodePattern,patternInfo in pairs(frame.args) do
        -- letter is the letter of a valid node we have
        for letter,_ in pairs(mapEncounterTable) do
            -- if letter is equal to the first letter in nodePattern, 
            if letter == mw.text.split(nodePattern,"")[1] then
                if mw.text.split(nodePattern,"")[2] ~= "_" then
                    local patternNum = mw.text.split(mw.text.split(nodePattern,"_")[1],"")[2]
                    -- If the second char is not a number, invalid. 
                    if tonumber(patternNum) == nil then return "<span style='color:red'>Please check your module invocation arguments. Something is invalid</span>" end
                    patternNum = tonumber(patternNum)
                    local nodePatternSplit = mw.text.split(nodePattern,"_")
                    local paramName = ""

                    -- get the parameter name, eg A1_xp's param name is just "Xp"
                    -- B3_form's param name is just "Form"
                    -- notice the conversion of capitalization
                    for i = 2, #nodePatternSplit do
                        paramName = paramName .. capitalize(nodePatternSplit[i])
                        if i ~= #nodePatternSplit then
                            paramName = paramName .. " "
                        end
                    end
                    if mapEncounterTable[letter][patternNum] == nil then
                        -- skeleton table for info for each pattern at a node.
                        -- eg, pattern 1 at node A, pattern 3 at node C, etc all need
                        -- the xp, lv, form, etc info
                        local nodePatternInfo = {["Xp"] = "",
                                                 ["Lv"] = "",
                                                 ["Node Info"] = "",
                                                 ["Form"] = "",
                                                 ["Air Pairity"] = "",
                                                 ["Air Superiority"] = ""}
                        mapEncounterTable[letter][patternNum] = nodePatternInfo
                    end
                    mapEncounterTable[letter][patternNum][paramName] = patternInfo
                    usedParams[paramName] = true
                end
            end
        end
    end

    html = p.renderEncounterTable(mapEncounterTable,usedParams, bossNode)

    return html

end

function p.replaceWordWithWikicode(str)
    local nodeInfoImageTable = {
        ["fuel"] = '[[File:Fuel.png|Fuel|25px]]',
        ["ammo"] = '[[File:Ammo.png|Ammo|25px]]',
        ["steel"] = '[[File:Steel.png|Steel|25px]]',
        ["bauxite"] = '[[File:Bauxite.png|Bauxite|25px]]'
    }
    local enemyShipTable = {
        ["dd_i%-class"] = '[[File:DD I Class.png|Destroyer I-Class|link=Destroyer I-Class]]',
        ["dd_i%-class_elite"] = '[[File:DD I Class2.png|Destroyer I-Class Elite|link=Destroyer I-Class]]',
        ["dd_i%-class_flagship"] = '[[File:DD_I_class3.png|Destroyer I-Class Flagship|link=Destroyer I-Class]]',
        ["dd_i%-class_late_model"] = '[[File:DD I Class 4.png|Destroyer I-Class Late Model|link=Destroyer I-Class]]',
        ["dd_ro%-class"] = '[[File:DD Ro Class.jpg|Destroyer Ro-Class|link=Destroyer Ro-Class]]',
        ["dd_ro%-class_elite"] = '[[File:DD Ro Class2.png|Destroyer Ro-Class Elite|link=Destroyer Ro-Class]]',
        ["dd_ro%-class_flagship"] = '[[File:DD Ro Class3.png|Destroyer Ro-Class Flagship|link=Destroyer Ro-Class]]',
        ["dd_ro%-class_late_model"] = '[[File:DD Ro Class 4.png|Destroyer Ro-Class Late Model|link=Destroyer Ro-Class]]',
        ["dd_ha%-class"] = '[[File:DD Ha Class.png|Destroyer Ha-Class|link=Destroyer Ha-Class]]',
        ["dd_ha%-class_elite"] = '[[File:DD Ha Class2.png|Destroyer Ha Class Elite|link=Destroyer Ha-Class]]',
        ["dd_ha%-class_flagship"] = '[[File:DD Ha Class3.png|Destroyer Ha Class Flagship|link=Destroyer Ha-Class]]',
        ["dd_ha%-class_late_model"] = '[[File:DD Ha Class 4.png|Destroyer Ha-Class Late Model|link=Destroyer Ha-Class]]',
        ["dd_ni%-class"] = '[[File:DD Ni Class.png|Destroyer Ni Class|link=Destroyer Ni-Class]]',
        ["dd_ni%-class_elite"] = '[[File:DD Ni Class2.png|Destroyer Ni Class Elite|link=Destroyer Ni-Class]]',
        ["dd_ni%-class_late_model"] = '[[File:DD Ni Class 4.png|Destroyer Ni-Class Late Model|link=Destroyer Ni-Class]]',
        ["cl_ho%-class"] = '[[File:CL Ho Class.png|Light Cruiser Ho Class|link=Light Cruiser Ho-Class]]',
        ["cl_ho%-class_elite"] = '[[File:CL Ho Class2.png|Light Cruiser Ho Class Elite|link=Light Cruiser Ho-Class]]',
        ["cl_ho%-class_flagship"] = '[[File:CL Ho Class3.png|Light Cruiser Ho Class Flagship|link=Light Cruiser Ho-Class]]',
        ["cl_he%-class"] = '[[File:CL He Class.png|Light Cruiser He Class|link=Light Cruiser He-Class]]',
        ["cl_he%-class_elite"] = '[[File:CL He Class2.png|Light Cruiser He Class Elite|link=Light Cruiser He-Class]]',
        ["cl_he%-class_flagship"] = '[[File:CL He Class3.png|Light Cruiser He Class Flagship|link=Light Cruiser He-Class]]',
        ["cl_to%-class"] = '[[File:CL To Class.png|Light Cruiser To Class|link=Light Cruiser To-Class]]',
        ["cl_to%-class_elite"] = '[[File:CL To Class2.png|Light Cruiser To Class Elite|link=Light Cruiser To-Class]]',
        ["cl_tsu%-class"] = '[[File:CL_Tsu_b.jpg|Light Cruiser Tsu Class|link=Light Cruiser Tsu-Class]]',
        ["cl_tsu%-class_elite"] = '[[File:CL_Tsu_elite_b.jpg|Light Cruiser Tsu Class|link=Light Cruiser Tsu-Class]]',
        ["clt_chi%-class"] = '[[File:CT Chi Class.png|Torpedo Cruiser Chi Class|link= Torpedo Cruiser Chi-Class]]',
        ["clt_chi%-class_elite"] = '[[File:CT Chi Class2.png|Torpedo Cruiser Chi Class Elite|link= Torpedo Cruiser Chi-Class]]',
        ["clt_chi%-class_flagship"] = '[[File:CT_Chi_Class3.png|Torpedo Cruiser Chi Class Flagship|link= Torpedo Cruiser Chi-Class]]',
        ["ca_ri%-class"] = '[[File:CA Ri Class.png|Heavy Cruiser Ri Class|link=Heavy Cruiser Ri-Class]]',
        ["ca_ri%-class_elite"] = '[[File:CA Ri Class2.png|Heavy Cruiser Ri Class Elite|link=Heavy Cruiser Ri-Class]]',
        ["ca_ri%-class_flagship"] = '[[File:CA Ri Class3.png|Heavy Cruiser Ri Class Flagship|link=Heavy Cruiser Ri-Class]]',
        ["ca_ri%-class_flagship_kai"] = '[[File:CA_Ri_Class4.png|Heavy Cruiser Ri Class Flagship|link=Heavy Cruiser Ri-Class]]',
        ["ca_ne%-class"] = '[[File:Ca_ne_b.jpg|Heavy Cruiser Ne Class|link=Heavy Cruiser Ne-Class]]',
        ["ca_ne%-class_elite"] = '[[File:Ca_ne_elite_b.jpg|Heavy Cruiser Ne Class Elite|link=Heavy Cruiser Ne-Class]]',
        ["cvl_nu%-class"] = '[[File:CVL Nu Class.png|Light Carrier Nu Class|link=Light Carrier Nu-Class]]',
        ["cvl_nu%-class_elite"] = '[File:CVL Nu Class2.png|Light Carrier Nu Class Elite|link=Light Carrier Nu-Class]]',
        ["cvl_nu%-class_flagship"] = '[[File:CVL_Nu_Class3.png|Light Carrier Nu Class Flagship|link=Light Carrier Nu-Class]]',
        ["cv_wo%-class"] = '[[File:CV O Class.png|Standard Carrier Wo Class|link=Standard Carrier Wo-Class]]',
        ["cv_wo%-class_elite"] = '[[File:CV O Class2.png|Standard Carrier Wo Class Elite|link=Standard Carrier Wo-Class]]',
        ["cv_wo%-class_flagship"] = '[[File:CV O Class3.jpg|Standard Carrier Wo Class Flagship|link=Standard Carrier Wo-Class]]',
        ["cv_wo%-class_flagship_2"] = '[[File:CV Wo Class5.png|Standard Carrier Wo Class Flagship II|link=Standard Carrier Wo-Class]]',
        ["cv_wo%-class_flagship_kai"] = '[[File:CV_Wo_Class4.png|Standard Carrier Wo Class kai Flagship|link=Standard Carrier Wo-Class]]',
        ["bb_ru%-class"] = '[[File:BB Ru Class.png|Battleship Ru Class|link=Battleship Ru-Class]]',
        ["bb_ru%-class_elite"] = '[[File:BB Ru Class2.png|Battleship Ru Class Elite|link=Battleship Ru-Class]]',
        ["bb_ru%-class_flagship"] = '[[File:BB Ru Class3.png|Battleship Ru Class Flagship|link=Battleship Ru-Class]]',
        ["bb_ru%-class_flagship_kai"] = '[[File:BB_Ru_Class4.png|Battleship Ru Class Flagship|link=Battleship Ru-Class]]',
        ["bb_ta%-class"] = '[[File:BB Ta Class.png|Battleship Ta Class|link=Battleship Ta-Class]]',
        ["bb_ta%-class_elite"] ='[[File:BB Ta Class2.png|Battleship Ta Class Elite|link=Battleship Ta-Class]]',
        ["bb_ta%-class_flagship"] = '[[File:BB Ta Class3.png|Battleship Ta Class Flagship|link=Battleship Ta-Class]]',
        ["bbv_re%-class"] = '[[File:BB_re_001.png|Battleship Re Class|link=Battleship Re-Class]]',
        ["bbv_re%-class_elite"] = '[[File:BB_re_002.png|Battleship Re Class Elite|link=Battleship Re-Class]]',
        ["transport_wa%-class"] = '[[File:AP Wa Class.png|Transport Ship Wa Class|link=Transport ship Wa-Class]]',
        ["transport_wa%-class_elite"] = '[[File:AP Wa Class2.png|Transport Wa Class Elite|link=Transport ship Wa-Class]]',
        ["transport_wa%-class_flagship"] = '[[File:Wa_flagship_card.png|Transport Wa Class Flagship|link=Transport ship Wa-Class]]',
        ["ss_ka%-class"] = '[[File:SS Ka Class.png|Submarine Ka Class|link=Submarine Ka-Class]]',
        ["ss_ka%-class_elite"] = '[[File:SS Ka Class2.png|Submarine Ka Class Elite|link=Submarine Ka-Class]]',
        ["ss_ka%-class_flagship"] = '[[File:SS Ka Class3.png|Submarine Ka Class Flagship|link=Submarine Ka-Class]]',
        ["ss_yo%-class"] = '[[File:SS Yo Class.png|Submarine Yo Class|link=Submarine Yo-Class]]',
        ["ss_yo%-class_elite"] = '|[[File:SS Yo Class2.png|Submarine Yo Class Elite|link=Submarine Yo-Class]]',
        ["ss_yo%-class_flagship"] = '[[File:SS Yo Class3.png|Submarine Yo Class Flagship|link=Submarine Yo-Class]]',
        ["ss_so%-class"] = '[[File:SS So Class.png|Submarine So Class|link=Submarine So-Class]]',
        ["ss_so%-class_elite"] = '[[File:SS So Class2.png|Submarine So Class|link=Submarine So-Class]]',
        ["ss_so%-class_flagship"] = '[[File:SS So Class3.png|Submarine So Class Flagship|link=Submarine So-Class]]',
    }
    if str ~= nil then
        for word,replacement in pairs(nodeInfoImageTable) do
            str = str:gsub(word,replacement)
        end
        for vesselName,wikicode in pairs(enemyShipTable) do
            str = str:gsub(vesselName,wikicode)
        end
        return str
    else
        return "Nil was passed instead of a string"
    end
end

return p
