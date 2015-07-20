function replaceWordWithWikicode(string)
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
    }
    if string ~= nil then
        for word,replacement in pairs(nodeInfoImageTable) do
            string = string:gsub(word,replacement)
        end
        for vesselName,wikicode in pairs(enemyShipTable) do
            string = string:gsub(vesselName,wikicode)
        end
        return string
    else
        return "Nil was passed instead of a string"
    end
end


print(replaceWordWithWikicode("fuel steel asdf"))
