local p = {}

-- Module for enemy encounter tables written by
-- Remi_Scarlet
-- I fucking hate lua.

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
            elseif v ~= "" and k ~= "label" then
                size = size+1
            end
        end
        return size
    end


    local numCols = 0
    for _,bool in pairs(headers) do
        if bool then numCols = numCols + 1 end
    end
    local body = mw.html.create("table")
    body:addClass("wikitable")
    local titleRow = mw.html.create("tr")
    local th = mw.html.create("th")
    th
        :attr("colspan",numCols+2)
        :wikitext("Nodes and Enemy Encounters")
        :css("font-weight","bold")
    titleRow:node(th)
    body:node(titleRow)
    local headerRow = mw.html.create("tr")
    th = mw.html.create("th")
    th:wikitext("Node")
    headerRow:node(th)
    th = mw.html.create("th")
    th:wikitext("Pattern")
    headerRow:node(th)
    local paramOrder = {"Xp","Lv","Node Info","Form"}
    for i,param in pairs(paramOrder) do
        if headers[param] then
            th = mw.html.create("th")
            th:wikitext(param)
            headerRow:node(th)
        end
    end
    -- Air superiority is a bit different so account for it
    if headers["Air Superiority"] or headers["Air Supremacy"] then
        th = mw.html.create("th")
        th:wikitext("Air")
        headerRow:node(th)
    end
    body:node(headerRow)
    local letterOrder = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
    for _,nodeLetter in pairs(letterOrder) do
        local values = info[nodeLetter]
        if values ~= nil then
            local firstRow = mw.html.create("tr")
            local firstCol = mw.html.create("td")
            local nodeName = nodeLetter
            if values["label"] ~= nil then
                nodeName = nodeName .. "<br>" .. values["label"]
            end

            firstCol
                    :wikitext(nodeName)
                    :css("text-align","center")
                    :css("font-weight","bold")
                    :attr("rowspan",tostring(getRowSize(values)))
            if nodeLetter == bossNode then
                firstCol:css("color","red")
                firstCol:css("font-weight","bold")
            end
            firstRow:node(firstCol)
            firstRow:node(mw.html.create("td"):wikitext("Pattern 1"))
            -- since first row with rowspan is handled differently, just
            -- do it separately
            if type(values[1]) == "table" then
                for _,param in pairs(paramOrder) do
                    if headers[param] then
                        local col = mw.html.create("td")
                        if values[1][param] ~= nil then
                            local text = values[1][param]
                            col:wikitext(p.replaceWordWithWikicode(text .. " "))
                            if param == "Node Info" and nil ~= string.find(string.lower(text),"class") then
                                col:css("text-align","left")
                            else
                                col:css("text-align","center")
                            end
                        end
                        firstRow:node(col)
                    end
                end
                if values[1]["Air Superiority"] ~= "" or values[1]["Air Supremacy"] ~= "" then
                    td = mw.html.create("td")
                    td:css("font-weight","bold")
                    td:css("text-align","center")
                    if values[i]["Air Superiority"] ~= "" then
                        td
                            :wikitext("AS")
                            :wikitext("<br>")
                            :wikitext(values[i]["Air Superiority"])
                    end
                    if values[i]["Air Supremacy"] ~= "" then
                        if values[i]["Air Superiority"] ~= "" then td:wikitext("<br>") end
                        td
                            :wikitext("AS+")
                            :wikitext("<br>")
                            :wikitext(values[i]["Air Supremacy"])
                    end
                    firstRow:node(td)
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
                    row:node(mw.html.create("td"):wikitext("Pattern "..i))
                    for _,param in pairs(paramOrder) do
                        if headers[param] then
                            local col = mw.html.create("td")
                            if values[1][param] ~= nil then
                                local text = values[1][param]
                                col:wikitext(p.replaceWordWithWikicode(text .. " "))
                                if param == "Node Info" and nil ~= string.find(string.lower(text),"class") then
                                    col:css("text-align","left")
                                else
                                    col:css("text-align","center")
                                end
                            end
                            row:node(col)
                        end
                    end
                    if values[i]["Air Superiority"] ~= "" or values[i]["Air Supremacy"] ~= "" then
                        td = mw.html.create("td")
                        td:css("font-weight","bold")
                        td:css("text-align","center")
                        if values[i]["Air Superiority"] ~= "" then
                            td
                                :wikitext("AS")
                                :wikitext("<br>")
                                :wikitext(values[i]["Air Superiority"])
                        end
                        if values[i]["Air Supremacy"] ~= "" then
                            if values[i]["Air Superiority"] ~= "" then td:wikitext("<br>") end
                            td
                                :wikitext("AS+")
                                :wikitext("<br>")
                                :wikitext(values[i]["Air Supremacy"])
                        end
                        row:node(td)
                    end

                    body:node(row)
                end
            end

        end
    end
    return tostring(body)
end

function p.encounterTemplate(frame)
    local bossNode = ""
    local mapEncounterTable = {}
    -- get list of params that are used, eg maybe none of the nodes have air_supremacy info. 
    -- In that case, don't bother adding column for it in the final html table
    local usedParams = {["Xp"] = false,
                        ["Lv"] = false,
                        ["Node Info"] = false,
                        ["Form"] = false,
                        ["Air Supremacy"] = false,
                        ["Air Superiority"] =false}
    local validNodeLetters = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
    -- map all the nodes we'll be using into mapEncounterTable -> {"A":true,"B"=true} etc
    for k,v in pairs(frame.args) do
        for i,letter in pairs(validNodeLetters) do
            local split = mw.text.split(k,"_")
            if valid(letter,mw.text.split(string.upper(split[1]),"")) then
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
            if letter == mw.text.split(string.upper(nodePattern),"")[1] then
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
                                                 ["Air Supremacy"] = "",
                                                 ["Air Superiority"] = ""}
                        mapEncounterTable[letter][patternNum] = nodePatternInfo
                    end
                    mapEncounterTable[letter][patternNum][paramName] = patternInfo
                    usedParams[paramName] = true
                end
                local split = mw.text.split(nodePattern,"_")
                if split[2] == "label" then
                    local letter = string.upper(mw.text.split(split[1],"")[1])
                    mapEncounterTable[letter]["label"] = patternInfo
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
        ["ammo"] = '[[File:Amm.png|Ammo|25px]]',
        ["steel"] = '[[File:Steel.png|Steel|25px]]',
        ["bauxite"] = '[[File:Bauxite.png|Bauxite|25px]]'
    }
    local formTable = {
        ["line_ahead"] = "[[file:LineAhead.jpg|Formation 1: Line Ahead|40px|center]]",
        ["double_line"] = "[[file:DoubleLine.jpg|Formation 2: Double Line|40px|ceneter]]",
        ["diamond"] = "[[file:Diamond.jpg|Formation 3: Diamond|40px|center]]",
        ["echelon"] = "[[file:Echelon.jpg|Formation 4: Echelon|40px|center]]",
        ["line_abreast"] = "[[file:LineAbreast.jpg|Formation 5: Line Abreast|40px|center]]"
    }
    local enemyShipTable = {
        ["dd_i%-class[%s$]"] = '[[File:DD I Class.png|Destroyer I%-Class|link=Destroyer I%-Class]]',
        ["dd_i%-class_elite[%s$]"] = '[[File:DD I Class2.png|Destroyer I%-Class Elite|link=Destroyer I%-Class]]',
        ["dd_i%-class_flagship[%s$]"] = '[[File:DD_I_class3.png|Destroyer I%-Class Flagship|link=Destroyer I%-Class]]',
        ["dd_i%-class_late_model[%s$]"] = '[[File:DD I Class 4.png|Destroyer I%-Class Late Model|link=Destroyer I%-Class]]',
        ["dd_ro%-class[%s$]"] = '[[File:DD Ro Class.jpg|Destroyer Ro%-Class|link=Destroyer Ro%-Class]]',
        ["dd_ro%-class_elite[%s$]"] = '[[File:DD Ro Class2.png|Destroyer Ro%-Class Elite|link=Destroyer Ro%-Class]]',
        ["dd_ro%-class_flagship[%s$]"] = '[[File:DD Ro Class3.png|Destroyer Ro%-Class Flagship|link=Destroyer Ro%-Class]]',
        ["dd_ro%-class_late_model[%s$]"] = '[[File:DD Ro Class 4.png|Destroyer Ro%-Class Late Model|link=Destroyer Ro%-Class]]',
        ["dd_ha%-class[%s$]"] = '[[File:DD Ha Class.png|Destroyer Ha%-Class|link=Destroyer Ha%-Class]]',
        ["dd_ha%-class_elite[%s$]"] = '[[File:DD Ha Class2.png|Destroyer Ha Class Elite|link=Destroyer Ha%-Class]]',
        ["dd_ha%-class_flagship[%s$]"] = '[[File:DD Ha Class3.png|Destroyer Ha Class Flagship|link=Destroyer Ha%-Class]]',
        ["dd_ha%-class_late_model[%s$]"] = '[[File:DD Ha Class 4.png|Destroyer Ha%-Class Late Model|link=Destroyer Ha%-Class]]',
        ["dd_ni%-class[%s$]"] = '[[File:DD Ni Class.png|Destroyer Ni Class|link=Destroyer Ni%-Class]]',
        ["dd_ni%-class_elite[%s$]"] = '[[File:DD Ni Class2.png|Destroyer Ni Class Elite|link=Destroyer Ni%-Class]]',
        ["dd_ni%-class_late_model[%s$]"] = '[[File:DD Ni Class 4.png|Destroyer Ni%-Class Late Model|link=Destroyer Ni%-Class]]',
        ["cl_ho%-class[%s$]"] = '[[File:CL Ho Class.png|Light Cruiser Ho Class|link=Light Cruiser Ho%-Class]]',
        ["cl_ho%-class_elite[%s$]"] = '[[File:CL Ho Class2.png|Light Cruiser Ho Class Elite|link=Light Cruiser Ho%-Class]]',
        ["cl_ho%-class_flagship[%s$]"] = '[[File:CL Ho Class3.png|Light Cruiser Ho Class Flagship|link=Light Cruiser Ho%-Class]]',
        ["cl_he%-class[%s$]"] = '[[File:CL He Class.png|Light Cruiser He Class|link=Light Cruiser He%-Class]]',
        ["cl_he%-class_elite[%s$]"] = '[[File:CL He Class2.png|Light Cruiser He Class Elite|link=Light Cruiser He%-Class]]',
        ["cl_he%-class_flagship[%s$]"] = '[[File:CL He Class3.png|Light Cruiser He Class Flagship|link=Light Cruiser He%-Class]]',
        ["cl_to%-class[%s$]"] = '[[File:CL To Class.png|Light Cruiser To Class|link=Light Cruiser To%-Class]]',
        ["cl_to%-class_elite[%s$]"] = '[[File:CL To Class2.png|Light Cruiser To Class Elite|link=Light Cruiser To%-Class]]',
        ["cl_tsu%-class[%s$]"] = '[[File:CL_Tsu_b.jpg|Light Cruiser Tsu Class|link=Light Cruiser Tsu%-Class]]',
        ["cl_tsu%-class_elite[%s$]"] = '[[File:CL_Tsu_elite_b.jpg|Light Cruiser Tsu Class|link=Light Cruiser Tsu%-Class]]',
        ["clt_chi%-class[%s$]"] = '[[File:CT Chi Class.png|Torpedo Cruiser Chi Class|link= Torpedo Cruiser Chi%-Class]]',
        ["clt_chi%-class_elite[%s$]"] = '[[File:CT Chi Class2.png|Torpedo Cruiser Chi Class Elite|link= Torpedo Cruiser Chi%-Class]]',
        ["clt_chi%-class_flagship[%s$]"] = '[[File:CT_Chi_Class3.png|Torpedo Cruiser Chi Class Flagship|link= Torpedo Cruiser Chi%-Class]]',
        ["ca_ri%-class[%s$]"] = '[[File:CA Ri Class.png|Heavy Cruiser Ri Class|link=Heavy Cruiser Ri%-Class]]',
        ["ca_ri%-class_elite[%s$]"] = '[[File:CA Ri Class2.png|Heavy Cruiser Ri Class Elite|link=Heavy Cruiser Ri%-Class]]',
        ["ca_ri%-class_flagship[%s$]"] = '[[File:CA Ri Class3.png|Heavy Cruiser Ri Class Flagship|link=Heavy Cruiser Ri%-Class]]',
        ["ca_ri%-class_flagship_kai[%s$]"] = '[[File:CA_Ri_Class4.png|Heavy Cruiser Ri Class Flagship|link=Heavy Cruiser Ri%-Class]]',
        ["ca_ne%-class[%s$]"] = '[[File:Ca_ne_b.jpg|Heavy Cruiser Ne Class|link=Heavy Cruiser Ne%-Class]]',
        ["ca_ne%-class_elite[%s$]"] = '[[File:Ca_ne_elite_b.jpg|Heavy Cruiser Ne Class Elite|link=Heavy Cruiser Ne%-Class]]',
        ["cvl_nu%-class[%s$]"] = '[[File:CVL Nu Class.png|Light Carrier Nu Class|link=Light Carrier Nu%-Class]]',
        ["cvl_nu%-class_elite[%s$]"] = '[File:CVL Nu Class2.png|Light Carrier Nu Class Elite|link=Light Carrier Nu%-Class]]',
        ["cvl_nu%-class_flagship[%s$]"] = '[[File:CVL_Nu_Class3.png|Light Carrier Nu Class Flagship|link=Light Carrier Nu%-Class]]',
        ["cv_wo%-class[%s$]"] = '[[File:CV O Class.png|Standard Carrier Wo Class|link=Standard Carrier Wo%-Class]]',
        ["cv_wo%-class_elite[%s$]"] = '[[File:CV O Class2.png|Standard Carrier Wo Class Elite|link=Standard Carrier Wo%-Class]]',
        ["cv_wo%-class_flagship[%s$]"] = '[[File:CV O Class3.jpg|Standard Carrier Wo Class Flagship|link=Standard Carrier Wo%-Class]]',
        ["cv_wo%-class_flagship_2[%s$]"] = '[[File:CV Wo Class5.png|Standard Carrier Wo Class Flagship II|link=Standard Carrier Wo%-Class]]',
        ["cv_wo%-class_flagship_kai[%s$]"] = '[[File:CV_Wo_Class4.png|Standard Carrier Wo Class kai Flagship|link=Standard Carrier Wo%-Class]]',
        ["bb_ru%-class[%s$]"] = '[[File:BB Ru Class.png|Battleship Ru Class|link=Battleship Ru%-Class]]',
        ["bb_ru%-class_elite[%s$]"] = '[[File:BB Ru Class2.png|Battleship Ru Class Elite|link=Battleship Ru%-Class]]',
        ["bb_ru%-class_flagship[%s$]"] = '[[File:BB Ru Class3.png|Battleship Ru Class Flagship|link=Battleship Ru%-Class]]',
        ["bb_ru%-class_flagship_kai[%s$]"] = '[[File:BB_Ru_Class4.png|Battleship Ru Class Flagship|link=Battleship Ru%-Class]]',
        ["bb_ta%-class[%s$]"] = '[[File:BB Ta Class.png|Battleship Ta Class|link=Battleship Ta%-Class]]',
        ["bb_ta%-class_elite[%s$]"] ='[[File:BB Ta Class2.png|Battleship Ta Class Elite|link=Battleship Ta%-Class]]',
        ["bb_ta%-class_flagship[%s$]"] = '[[File:BB Ta Class3.png|Battleship Ta Class Flagship|link=Battleship Ta%-Class]]',
        ["bbv_re%-class[%s$]"] = '[[File:BB_re_001.png|Battleship Re Class|link=Battleship Re%-Class]]',
        ["bbv_re%-class_elite[%s$]"] = '[[File:BB_re_002.png|Battleship Re Class Elite|link=Battleship Re%-Class]]',
        ["transport_wa%-class[%s$]"] = '[[File:AP Wa Class.png|Transport Ship Wa Class|link=Transport ship Wa%-Class]]',
        ["transport_wa%-class_elite[%s$]"] = '[[File:AP Wa Class2.png|Transport Wa Class Elite|link=Transport ship Wa%-Class]]',
        ["transport_wa%-class_flagship[%s$]"] = '[[File:Wa_flagship_card.png|Transport Wa Class Flagship|link=Transport ship Wa%-Class]]',
        ["ss_ka%-class[%s$]"] = '[[File:SS Ka Class.png|Submarine Ka Class|link=Submarine Ka%-Class]]',
        ["ss_ka%-class_elite[%s$]"] = '[[File:SS Ka Class2.png|Submarine Ka Class Elite|link=Submarine Ka%-Class]]',
        ["ss_ka%-class_flagship[%s$]"] = '[[File:SS Ka Class3.png|Submarine Ka Class Flagship|link=Submarine Ka%-Class]]',
        ["ss_yo%-class[%s$]"] = '[[File:SS Yo Class.png|Submarine Yo Class|link=Submarine Yo%-Class]]',
        ["ss_yo%-class_elite[%s$]"] = '|[[File:SS Yo Class2.png|Submarine Yo Class Elite|link=Submarine Yo%-Class]]',
        ["ss_yo%-class_flagship[%s$]"] = '[[File:SS Yo Class3.png|Submarine Yo Class Flagship|link=Submarine Yo%-Class]]',
        ["ss_so%-class[%s$]"] = '[[File:SS So Class.png|Submarine So Class|link=Submarine So%-Class]]',
        ["ss_so%-class_elite[%s$]"] = '[[File:SS So Class2.png|Submarine So Class|link=Submarine So%-Class]]',
        ["ss_so%-class_flagship[%s$]"] = '[[File:SS So Class3.png|Submarine So Class Flagship|link=Submarine So%-Class]]',
        ["armored_carrier_demon"] = '[[File:Armored CV ghost.png|Armored Carrier Demon|link=Armored Carrier Demon]]',
        ["armored_carrier_princess"] = '|[[File:Armored CV queen.png|Armored Carrier Princess|link=Armored Carrier Princess]]',
        ["floating_fortress_1"] = '[[File:Floating Platform.png|Floating Fortress|link=Floating Fortress]]',
        ["floating_fortress_2"] = '[[File:Floating Platform2.png|Floating Fortress|link=Floating Fortress]]',
        ["floating_fortress_3"] = '[[File:Floating Platform3.png|Floating Fortress|link=Floating Fortress]]',
        ["anchorage_demon"] = '[[File:Ancorage_Demon_card.png|Anchorage Demon|link=Anchorage Demon]]',
        ["anchorage_princess"] = '[[File:Anchorage_Princess_card.png|Anchorage Princess|link=Anchorage Princess]]',
        ["escort_fortress_1"] = '[[File:Floating Platform.png|Escort Fortress|link=Escort Fortress]]',
        ["escort_fortress_2"] = '[[File:Floating Platform2.png|Escort Fortress|link=Escort Fortress]]',
        ["escort_fortress_3"] = '[[File:Floating Platform3.png|Escort Fortress|link=Escort Fortress]]',
        ["southern_demon"] = '[[File:Southern_Demon_card.png|Southern Demon|link=Southern Demon]]',
        ["southern_war_demon"] = '[[File:Southern_War_Demon_card.png|Southern War Demon|link=Southern War Demon]]',
        ["southern_war_princess"] = '[[File:Southern_War_Princess_card.png|Southern War Princess|link=Southern War Princess]]',
        ["airfield_princess"] = '[[File:Port_hime_card.png|Airfield Princess|link=Airfield Princess]]',
        ["battleship_princess"] = '[[File:Bb_hime_card.png|Battleship Princess|link=Battleship Princess]]',
        ["harbor_princess"] = '[[File:Harbor_hime_card.JPG|Harbour Princess|link=Harbour Princess]]',
        ["isolated_island_demon"] = '[[File:Isolated_Island_Oni_card.JPG|Isolated Island Demon|link=Isolated Island Demon]]',
        ["northern_princess"] = '[[File:581_Card.jpg|Northern Princess|link=Northern Princess]]',
        ["northern_princess_final_form"] = '[[File:582_Card.jpg|Northern Princess Final Form|link=Northern Princess]]',
        ["northern_princess_3%-5"] = '[[File:588 Card.png|Northern Princess|link=Northern_Princess]]',
        ["northern_princess_3%-5_final_form"] = '[[File:582_Card.jpg|Northern Princess Final Form|link=Northern Princess]]',
        ["aircraft_carrier_demon"] = '[[File:585_Card.jpg|Aircraft Carrier Demon|link=Aircraft Carrier Demon]]',
        ["midway_princess"] = '[[File:583_Card.jpg|Midway Princess|link=Midway Princess]]',
        ["midway_princess_final_form"] = '[[File:584_Card.jpg|Midway Princess Final Form|link=Midway Princess]]',
        ["aircraft_carrier_princess"] = '[[File:586_Card.jpg|Aircraft Carrier Princess|link=Aircraft Carrier Princess]]',
        ["destroyer_princess"] = '[[File:Kuchikuseiki_b.jpg|Destroyer Princess|link=Destroyer Princess]]',
        ["aircraft_carrier_water_demon"] = '[[File:Kuubosuiki_b.jpg|Aircraft Carrier Water Demon|link=Aircraft Carrier Water Demon]]',
        ["aircraft_carrier_water_demon_final_form"] = '[[File:Kuubosuiki_b.jpg|Aircraft Carrier Water Demon|link=Aircraft Carrier Water Demon]]',
        ["light_cruiser_demon"] = '[[File:CL_demon1_card.png|Light Cruiser Demon|link=Light Cruiser Demon]]',
        ["light_cruiser_demon_final_form"] = '[[File:CL_demon2_card.png|Light Cruiser Demon|link=Light Cruiser Demon]]',
        ["battleship_water_demon"] = '[[File:BB Water Oni.png|Battleship Water Demon|link=Battleship Water Demon]]',
        ["battleship_water_demon_final_form"] = '[[File:BB Water Oni2.png|Battleship Water Demon|link=Battleship Water Demon]]',
    }
    if str ~= nil then

        local originalString = str
        str = string.lower(str)

        for vesselName,wikicode in pairs(enemyShipTable) do
            str = str:gsub(vesselName,wikicode)
        end
        local i = 0
        local count = 0
        for j=0, 2 do
            local prev = i
            _, i = string.find(str,"]]",i)
            if i == nil then
                i = prev
            else
                count = count + 1
            end
        end
        if count == 3 and str ~= nil then
            str = str:sub(0,i) .. "<br>" .. str:sub(i+1,#str)
        end
        if count == 0 or string.find(string.lower(str),"maelstrom") ~= nil then
            str = originalString
        end
        for word,replacement in pairs(nodeInfoImageTable) do
            str = str:gsub(word,replacement)
        end
        for form,wikicode in pairs(formTable) do
            str = str:gsub(form,wikicode)
        end
        return str
    else
        return "Nil was passed instead of a string"
    end
end

return p
