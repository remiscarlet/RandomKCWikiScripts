local p = {}

-- This disgusting module for shipdrops made by
-- Remi_Scarlet
-- Please at least give some mention of credit if you want to modify/reuse/whatever. I don't actually care but it'd be nice of you.
-- I fucking hate lua.

function p.formatShipDropTable(tableInfo)
    local order = {"1","2","3","4","5","6"}
    local worldOrder = {"World1", "World2", "World3", "World4", "World5", "World6"}
    local html = ""
    html = html .. "<tr><td>[[" .. tableInfo["ShipName"] .. "]]</td>"
    local style = {["1"] = 'background-color:#8ac',
                    ["2"] = 'background-color:#ace',
                    ["3"] = 'background-color:#0ff',
                    ["4"] = 'background-color:#bbb',
                    ["5"] = 'background-color:#fc0',
                    ["6"] = 'background-color:#ffaaff',
                    ["7"] = 'background-color:#ff55ff',
                    ["8"] = 'background-color:#aa00aa; color:#fff'}
    local rarity = tableInfo["Rarity"]
    html = html .. "<td style=\"" .. style[rarity] .. ";\">" .. rarity .. "</td>"
    html = html .. "<td>" .. tableInfo["No."] .. "</td>"
    for i,world in pairs(worldOrder) do
        for ii,map in pairs(order) do
            local val = tableInfo[world][map]
            if val ~= nil then
                html = html .. "<td style=\"" .. val["style"] .. "\">" .. val["drop"] .. "</td>"
            end
        end
    end 
    html = html .. "<td>" .. tableInfo["Remarks"] .. "</td>"
    html = html .. "</tr>"
    return html
end

function p.returnShipDrop(frame)
    local dropList = {}
    dropList["Nagato"] = {
        ["ShipName"] = "Nagato",
        ["Rarity"] = "7",
        ["No."] = "001",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Mutsu"] = {
        ["ShipName"] = "Mutsu",
        ["Rarity"] = "7",
        ["No."] = "002",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Ise"] = {
        ["ShipName"] = "Ise",
        ["Rarity"] = "5",
        ["No."] = "003",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hyuuga"] = {
        ["ShipName"] = "Hyuuga",
        ["Rarity"] = "5",
        ["No."] = "004",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Yukikaze"] = {
        ["ShipName"] = "Yukikaze",
        ["Rarity"] = "6",
        ["No."] = "005",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Akagi"] = {
        ["ShipName"] = "Akagi",
        ["Rarity"] = "6",
        ["No."] = "006",
        ["Remarks"] = "''Quest ''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kaga"] = {
        ["ShipName"] = "Kaga",
        ["Rarity"] = "5",
        ["No."] = "007",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Souryuu"] = {
        ["ShipName"] = "Souryuu",
        ["Rarity"] = "5",
        ["No."] = "008",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hiryuu"] = {
        ["ShipName"] = "Hiryuu",
        ["Rarity"] = "6",
        ["No."] = "009",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Shimakaze"] = {
        ["ShipName"] = "Shimakaze",
        ["Rarity"] = "6",
        ["No."] = "010",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Fubuki"] = {
        ["ShipName"] = "Fubuki",
        ["Rarity"] = "3",
        ["No."] = "011",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Shirayuki"] = {
        ["ShipName"] = "Shirayuki",
        ["Rarity"] = "2",
        ["No."] = "012",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hatsuyuki"] = {
        ["ShipName"] = "Hatsuyuki",
        ["Rarity"] = "1",
        ["No."] = "013",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Miyuki"] = {
        ["ShipName"] = "Miyuki",
        ["Rarity"] = "2",
        ["No."] = "014",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Murakumo"] = {
        ["ShipName"] = "Murakumo",
        ["Rarity"] = "2",
        ["No."] = "015",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Isonami"] = {
        ["ShipName"] = "Isonami",
        ["Rarity"] = "1",
        ["No."] = "016",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Ayanami"] = {
        ["ShipName"] = "Ayanami",
        ["Rarity"] = "3",
        ["No."] = "017",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Shikinami"] = {
        ["ShipName"] = "Shikinami",
        ["Rarity"] = "2",
        ["No."] = "018",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Ooi"] = {
        ["ShipName"] = "Ooi",
        ["Rarity"] = "5",
        ["No."] = "019",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kitakami"] = {
        ["ShipName"] = "Kitakami",
        ["Rarity"] = "4",
        ["No."] = "020",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kongou"] = {
        ["ShipName"] = "Kongou",
        ["Rarity"] = "5",
        ["No."] = "021",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hiei"] = {
        ["ShipName"] = "Hiei",
        ["Rarity"] = "5",
        ["No."] = "022",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Haruna"] = {
        ["ShipName"] = "Haruna",
        ["Rarity"] = "5",
        ["No."] = "023",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kirishima"] = {
        ["ShipName"] = "Kirishima",
        ["Rarity"] = "5",
        ["No."] = "024",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "O", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Houshou"] = {
        ["ShipName"] = "Houshou",
        ["Rarity"] = "3",
        ["No."] = "025",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Fusou"] = {
        ["ShipName"] = "Fusou",
        ["Rarity"] = "4",
        ["No."] = "026",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
        }
    }
    dropList["Yamashiro"] = {
        ["ShipName"] = "Yamashiro",
        ["Rarity"] = "4",
        ["No."] = "027",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Tenryuu"] = {
        ["ShipName"] = "Tenryuu",
        ["Rarity"] = "3",
        ["No."] = "028",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Tatsuta"] = {
        ["ShipName"] = "Tatsuta",
        ["Rarity"] = "3",
        ["No."] = "029",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Ryuujou"] = {
        ["ShipName"] = "Ryuujou",
        ["Rarity"] = "4",
        ["No."] = "030",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Mutsuki"] = {
        ["ShipName"] = "Mutsuki",
        ["Rarity"] = "3",
        ["No."] = "031",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kisaragi"] = {
        ["ShipName"] = "Kisaragi",
        ["Rarity"] = "2",
        ["No."] = "032",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Satsuki"] = {
        ["ShipName"] = "Satsuki",
        ["Rarity"] = "2",
        ["No."] = "033",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Fumizuki"] = {
        ["ShipName"] = "Fumizuki",
        ["Rarity"] = "2",
        ["No."] = "034",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Nagatsuki"] = {
        ["ShipName"] = "Nagatsuki",
        ["Rarity"] = "2",
        ["No."] = "035",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kikuzuki"] = {
        ["ShipName"] = "Kikuzuki",
        ["Rarity"] = "1",
        ["No."] = "036",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Mikazuki"] = {
        ["ShipName"] = "Mikazuki",
        ["Rarity"] = "1",
        ["No."] = "037",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Mochizuki"] = {
        ["ShipName"] = "Mochizuki",
        ["Rarity"] = "1",
        ["No."] = "038",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kuma"] = {
        ["ShipName"] = "Kuma",
        ["Rarity"] = "4",
        ["No."] = "039",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Tama"] = {
        ["ShipName"] = "Tama",
        ["Rarity"] = "2",
        ["No."] = "040",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kiso"] = {
        ["ShipName"] = "Kiso",
        ["Rarity"] = "1",
        ["No."] = "041",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Nagara"] = {
        ["ShipName"] = "Nagara",
        ["Rarity"] = "4",
        ["No."] = "042",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Isuzu"] = {
        ["ShipName"] = "Isuzu",
        ["Rarity"] = "2",
        ["No."] = "043",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Natori"] = {
        ["ShipName"] = "Natori",
        ["Rarity"] = "2",
        ["No."] = "044",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Yura"] = {
        ["ShipName"] = "Yura",
        ["Rarity"] = "1",
        ["No."] = "045",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Sendai"] = {
        ["ShipName"] = "Sendai",
        ["Rarity"] = "4",
        ["No."] = "046",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Jintsuu"] = {
        ["ShipName"] = "Jintsuu",
        ["Rarity"] = "1",
        ["No."] = "047",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Naka"] = {
        ["ShipName"] = "Naka",
        ["Rarity"] = "2",
        ["No."] = "048",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Chitose"] = {
        ["ShipName"] = "Chitose",
        ["Rarity"] = "2",
        ["No."] = "049",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Chiyoda"] = {
        ["ShipName"] = "Chiyoda",
        ["Rarity"] = "1",
        ["No."] = "050",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Mogami"] = {
        ["ShipName"] = "Mogami",
        ["Rarity"] = "4",
        ["No."] = "051",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Furutaka"] = {
        ["ShipName"] = "Furutaka",
        ["Rarity"] = "3",
        ["No."] = "052",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kako"] = {
        ["ShipName"] = "Kako",
        ["Rarity"] = "1",
        ["No."] = "053",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Aoba"] = {
        ["ShipName"] = "Aoba",
        ["Rarity"] = "3",
        ["No."] = "054",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Myoukou"] = {
        ["ShipName"] = "Myoukou",
        ["Rarity"] = "4",
        ["No."] = "055",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Nachi"] = {
        ["ShipName"] = "Nachi",
        ["Rarity"] = "1",
        ["No."] = "056",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Ashigara"] = {
        ["ShipName"] = "Ashigara",
        ["Rarity"] = "2",
        ["No."] = "057",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Haguro"] = {
        ["ShipName"] = "Haguro",
        ["Rarity"] = "1",
        ["No."] = "058",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Takao"] = {
        ["ShipName"] = "Takao",
        ["Rarity"] = "4",
        ["No."] = "059",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Atago"] = {
        ["ShipName"] = "Atago",
        ["Rarity"] = "4",
        ["No."] = "060",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Maya"] = {
        ["ShipName"] = "Maya",
        ["Rarity"] = "1",
        ["No."] = "061",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Choukai"] = {
        ["ShipName"] = "Choukai",
        ["Rarity"] = "1",
        ["No."] = "062",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Tone"] = {
        ["ShipName"] = "Tone",
        ["Rarity"] = "4",
        ["No."] = "063",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Chikuma"] = {
        ["ShipName"] = "Chikuma",
        ["Rarity"] = "4",
        ["No."] = "064",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hiyou"] = {
        ["ShipName"] = "Hiyou",
        ["Rarity"] = "4",
        ["No."] = "065",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Jun'you"] = {
        ["ShipName"] = "Jun'you",
        ["Rarity"] = "4",
        ["No."] = "066",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Oboro"] = {
        ["ShipName"] = "Oboro",
        ["Rarity"] = "1",
        ["No."] = "067",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Akebono"] = {
        ["ShipName"] = "Akebono",
        ["Rarity"] = "1",
        ["No."] = "068",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Sazanami"] = {
        ["ShipName"] = "Sazanami",
        ["Rarity"] = "2",
        ["No."] = "069",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Ushio"] = {
        ["ShipName"] = "Ushio",
        ["Rarity"] = "1",
        ["No."] = "070",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Akatsuki"] = {
        ["ShipName"] = "Akatsuki",
        ["Rarity"] = "3",
        ["No."] = "071",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hibiki"] = {
        ["ShipName"] = "Hibiki",
        ["Rarity"] = "2",
        ["No."] = "072",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Ikazuchi"] = {
        ["ShipName"] = "Ikazuchi",
        ["Rarity"] = "1",
        ["No."] = "073",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Inazuma"] = {
        ["ShipName"] = "Inazuma",
        ["Rarity"] = "1",
        ["No."] = "074",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hatsuharu"] = {
        ["ShipName"] = "Hatsuharu",
        ["Rarity"] = "3",
        ["No."] = "075",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Nenohi"] = {
        ["ShipName"] = "Nenohi",
        ["Rarity"] = "1",
        ["No."] = "076",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Wakaba"] = {
        ["ShipName"] = "Wakaba",
        ["Rarity"] = "2",
        ["No."] = "077",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hatsushimo"] = {
        ["ShipName"] = "Hatsushimo",
        ["Rarity"] = "2",
        ["No."] = "078",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Shiratsuyu"] = {
        ["ShipName"] = "Shiratsuyu",
        ["Rarity"] = "3",
        ["No."] = "079",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Shigure"] = {
        ["ShipName"] = "Shigure",
        ["Rarity"] = "2",
        ["No."] = "080",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Murasame"] = {
        ["ShipName"] = "Murasame",
        ["Rarity"] = "2",
        ["No."] = "081",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Yuudachi"] = {
        ["ShipName"] = "Yuudachi",
        ["Rarity"] = "2",
        ["No."] = "082",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Samidare"] = {
        ["ShipName"] = "Samidare",
        ["Rarity"] = "2",
        ["No."] = "083",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Suzukaze"] = {
        ["ShipName"] = "Suzukaze",
        ["Rarity"] = "3",
        ["No."] = "084",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Asashio"] = {
        ["ShipName"] = "Asashio",
        ["Rarity"] = "3",
        ["No."] = "085",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Ooshio"] = {
        ["ShipName"] = "Ooshio",
        ["Rarity"] = "1",
        ["No."] = "086",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Michishio"] = {
        ["ShipName"] = "Michishio",
        ["Rarity"] = "1",
        ["No."] = "087",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Arashio"] = {
        ["ShipName"] = "Arashio",
        ["Rarity"] = "1",
        ["No."] = "088",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Arare"] = {
        ["ShipName"] = "Arare",
        ["Rarity"] = "1",
        ["No."] = "089",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kasumi"] = {
        ["ShipName"] = "Kasumi",
        ["Rarity"] = "2",
        ["No."] = "090",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kagerou"] = {
        ["ShipName"] = "Kagerou",
        ["Rarity"] = "3",
        ["No."] = "091",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Shiranui"] = {
        ["ShipName"] = "Shiranui",
        ["Rarity"] = "2",
        ["No."] = "092",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kuroshio"] = {
        ["ShipName"] = "Kuroshio",
        ["Rarity"] = "1",
        ["No."] = "093",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Shouhou"] = {
        ["ShipName"] = "Shouhou",
        ["Rarity"] = "4",
        ["No."] = "094",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Shoukaku"] = {
        ["ShipName"] = "Shoukaku",
        ["Rarity"] = "5",
        ["No."] = "106",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Zuikaku"] = {
        ["ShipName"] = "Zuikaku",
        ["Rarity"] = "6",
        ["No."] = "107",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kinu"] = {
        ["ShipName"] = "Kinu",
        ["Rarity"] = "4",
        ["No."] = "109",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Abukuma"] = {
        ["ShipName"] = "Abukuma",
        ["Rarity"] = "5",
        ["No."] = "110",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Yuubari"] = {
        ["ShipName"] = "Yuubari",
        ["Rarity"] = "5",
        ["No."] = "111",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Zuihou"] = {
        ["ShipName"] = "Zuihou",
        ["Rarity"] = "5",
        ["No."] = "112",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Mikuma"] = {
        ["ShipName"] = "Mikuma",
        ["Rarity"] = "5",
        ["No."] = "116",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #ecea4c; "},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hatsukaze"] = {
        ["ShipName"] = "Hatsukaze",
        ["Rarity"] = "4",
        ["No."] = "118",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Maikaze"] = {
        ["ShipName"] = "Maikaze",
        ["Rarity"] = "4",
        ["No."] = "119",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kinugasa"] = {
        ["ShipName"] = "Kinugasa",
        ["Rarity"] = "4",
        ["No."] = "120",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["I-19"] = {
        ["ShipName"] = "I-19",
        ["Rarity"] = "4",
        ["No."] = "123",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = "background-color: #ecea4c; "},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Suzuya"] = {
        ["ShipName"] = "Suzuya",
        ["Rarity"] = "4",
        ["No."] = "124",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kumano"] = {
        ["ShipName"] = "Kumano",
        ["Rarity"] = "4",
        ["No."] = "125",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["I-168"] = {
        ["ShipName"] = "I-168",
        ["Rarity"] = "3",
        ["No."] = "126",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color:rgb(125,248,58); "},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "O", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["I-58"] = {
        ["ShipName"] = "I-58",
        ["Rarity"] = "4",
        ["No."] = "127",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["I-8"] = {
        ["ShipName"] = "I-8",
        ["Rarity"] = "5",
        ["No."] = "128",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Yamato"] = {
        ["ShipName"] = "Yamato",
        ["Rarity"] = "8",
        ["No."] = "131",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Akigumo"] = {
        ["ShipName"] = "Akigumo",
        ["Rarity"] = "4",
        ["No."] = "132",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Yuugumo"] = {
        ["ShipName"] = "Yuugumo",
        ["Rarity"] = "4",
        ["No."] = "133",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Makigumo"] = {
        ["ShipName"] = "Makigumo",
        ["Rarity"] = "4",
        ["No."] = "134",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Naganami"] = {
        ["ShipName"] = "Naganami",
        ["Rarity"] = "4",
        ["No."] = "135",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Agano"] = {
        ["ShipName"] = "Agano",
        ["Rarity"] = "5",
        ["No."] = "137",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Noshiro"] = {
        ["ShipName"] = "Noshiro",
        ["Rarity"] = "5",
        ["No."] = "138",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Yahagi"] = {
        ["ShipName"] = "Yahagi",
        ["Rarity"] = "6",
        ["No."] = "139",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Sakawa"] = {
        ["ShipName"] = "Sakawa",
        ["Rarity"] = "5",
        ["No."] = "140",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Musashi"] = {
        ["ShipName"] = "Musashi",
        ["Rarity"] = "8",
        ["No."] = "143",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Taihou"] = {
        ["ShipName"] = "Taihou",
        ["Rarity"] = "7",
        ["No."] = "153",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Katori"] = {
        ["ShipName"] = "Katori",
        ["Rarity"] = "4",
        ["No."] = "154",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["I-401"] = {
        ["ShipName"] = "I-401",
        ["Rarity"] = "6",
        ["No."] = "155",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "O", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Akitsu Maru"] = {
        ["ShipName"] = "Akitsu Maru",
        ["Rarity"] = "5",
        ["No."] = "161",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Maruyu"] = {
        ["ShipName"] = "Maruyu",
        ["Rarity"] = "5",
        ["No."] = "163",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Yayoi"] = {
        ["ShipName"] = "Yayoi",
        ["Rarity"] = "4",
        ["No."] = "164",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: yellow; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: yellow; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: yellow; "},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: yellow; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: yellow; "},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: yellow; "},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: yellow; "},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: yellow; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: yellow; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "O", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Uzuki"] = {
        ["ShipName"] = "Uzuki",
        ["Rarity"] = "4",
        ["No."] = "165",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Isokaze"] = {
        ["ShipName"] = "Isokaze",
        ["Rarity"] = "5",
        ["No."] = "167",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Urakaze"] = {
        ["ShipName"] = "Urakaze",
        ["Rarity"] = "4",
        ["No."] = "168",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Tanikaze"] = {
        ["ShipName"] = "Tanikaze",
        ["Rarity"] = "4",
        ["No."] = "169",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hamakaze"] = {
        ["ShipName"] = "Hamakaze",
        ["Rarity"] = "4",
        ["No."] = "170",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Bismarck"] = {
        ["ShipName"] = "Bismarck",
        ["Rarity"] = "7",
        ["No."] = "171",
        ["Remarks"] = "LSC Crafting",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Z1"] = {
        ["ShipName"] = "Z1",
        ["Rarity"] = "5",
        ["No."] = "174",
        ["Remarks"] = "''Quest''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Z3"] = {
        ["ShipName"] = "Z3",
        ["Rarity"] = "5",
        ["No."] = "175",
        ["Remarks"] = "",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Prinz Eugen"] = {
        ["ShipName"] = "Prinz Eugen",
        ["Rarity"] = "6",
        ["No."] = "176",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Amatsukaze"] = {
        ["ShipName"] = "Amatsukaze",
        ["Rarity"] = "6",
        ["No."] = "181",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Akashi"] = {
        ["ShipName"] = "Akashi",
        ["Rarity"] = "6",
        ["No."] = "182",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X",    ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "O", ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "O", ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Ooyodo"] = {
        ["ShipName"] = "Ooyodo",
        ["Rarity"] = "6",
        ["No."] = "183",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Taigei"] = {
        ["ShipName"] = "Taigei",
        ["Rarity"] = "4",
        ["No."] = "184",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "X", ["style"] = "background-color: #7df83a; "},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Tokitsukaze"] = {
        ["ShipName"] = "Tokitsukaze",
        ["Rarity"] = "5",
        ["No."] = "186",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Unryuu"] = {
        ["ShipName"] = "Unryuu",
        ["Rarity"] = "6",
        ["No."] = "201",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Amagi"] = {
        ["ShipName"] = "Amagi",
        ["Rarity"] = "6",
        ["No."] = "202",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Harusame"] = {
        ["ShipName"] = "Harusame",
        ["Rarity"] = "4",
        ["No."] = "205",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Hayashimo"] = {
        ["ShipName"] = "Hayashimo",
        ["Rarity"] = "4",
        ["No."] = "209",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Kiyoshimo"] = {
        ["ShipName"] = "Kiyoshimo",
        ["Rarity"] = "4",
        ["No."] = "210",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Asagumo"] = {
        ["ShipName"] = "Asagumo",
        ["Rarity"] = "4",
        ["No."] = "213",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Yamagumo"] = {
        ["ShipName"] = "Yamagumo",
        ["Rarity"] = "4",
        ["No."] = "214",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "X", ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "X", ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Nowaki"] = {
        ["ShipName"] = "Nowaki",
        ["Rarity"] = "4",
        ["No."] = "215",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Akizuki"] = {
        ["ShipName"] = "Akizuki",
        ["Rarity"] = "6",
        ["No."] = "221",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Asashimo"] = {
        ["ShipName"] = "Asashimo",
        ["Rarity"] = "4",
        ["No."] = "225",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Littorio"] = {
        ["ShipName"] = "Littorio",
        ["Rarity"] = "7",
        ["No."] = "241",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Katsuragi"] = {
        ["ShipName"] = "Katsuragi",
        ["Rarity"] = "7",
        ["No."] = "203",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Akitsushima"] = {
        ["ShipName"] = "Akitsushima",
        ["Rarity"] = "7",
        ["No."] = "245",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["Takanami"] = {
        ["ShipName"] = "Takanami",
        ["Rarity"] = "4",
        ["No."] = "224",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }
    dropList["U-511"] = {
        ["ShipName"] = "U-511",
        ["Rarity"] = "5",
        ["No."] = "231",
        ["Remarks"] = "'''''Unbuildable'''''",
        ["World1"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
            ["6"] = {   ["drop"] = "",  ["style"] = ""}
        },
        ["World2"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World3"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World4"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World5"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
            ["5"] = {   ["drop"] = "",  ["style"] = ""},
        },
        ["World6"] = {
            ["1"] = {   ["drop"] = "",  ["style"] = ""},
            ["2"] = {   ["drop"] = "",  ["style"] = ""},
            ["3"] = {   ["drop"] = "",  ["style"] = ""},
            ["4"] = {   ["drop"] = "",  ["style"] = ""},
        }
    }




    -- Lazy. Will modify later to be more like Infobox module
    -- Please don't shoot me. I want to kill myself at how ugly this is, too. dw.
    local html = "<ol><li>Symbols<ul><li>X = Obtainable <b>only</b> in boss nodes.</li><li>O = Obtainable in any node beside the boss node.</li></ul></li><li>Drops were referenced from both [http://wikiwiki.jp/kancolle/?%B4%CF%CC%BC%A5%C9%A5%ED%A5%C3%A5%D7%B5%D5%B0%FA%A4%AD Kancolle Japanese Wikiwiki] and [http://www56.atwiki.jp/kancolle/pages/26.html Kancolle Japanese @WIki].</li><li>Background Coloring<ul><li>Yellow Background means the drop is cited at only one of the sources.</li><li>Green Background means the drop is cited by both sources.</li><li>No Background means ship in question isn't rare enough to warrant color coding (you can add the background yourself if you want).</li></ul></li><li>Unless specified, all ships are obtainable through crafting.<ul><li>Ships that are only craftable through Large Ship Construction (LSC) will have notes to specify (<i>LSC Crafting</i>).</li></ul></li></ol>"
    html = html .. '<table class="wikitable" style="text-align: center; width:100%;"><tr><th colspan="1" rowspan="2" style="width:10%;"> Ship Name</th><th colspan="1" rowspan="2" style="width:2%;"> Rarity</th><th colspan="1" rowspan="2" style="width:3%;"> No.</th><th colspan="1" rowspan="167" style="background-color: #dddcb1; width:.8%;"></th><th colspan="6" rowspan="1" style="width:12.5%;"> [[World_1:_%E9%8E%AE%E5%AE%88%E5%BA%9C%E6%B5%B7%E5%9F%9F | World 1]]</th><th colspan="1" rowspan="167" style="background-color: #dddcb1; width:.8%;"></th><th colspan="5" rowspan="1" style="width:12.5%;"> [[World_2:_%E5%8D%97%E8%A5%BF%E8%AB%B8%E5%B3%B6%E6%B5%B7%E5%9F%9F | World 2]]</th><th colspan="1" rowspan="167" style="background-color: #dddcb1; width:.8%;"></th><th colspan="5" rowspan="1" style="width:12.5%;"> [[World_3:_%E5%8C%97%E6%96%B9%E6%B5%B7%E5%9F%9F | World 3]]</th><th colspan="1" rowspan="167" style="background-color: #dddcb1; width:.8%;"></th><th colspan="4" rowspan="1" style="width:11%;"> [[World_4:_%E8%A5%BF%E6%96%B9%E6%B5%B7%E5%9F%9F | World 4]]</th><th colspan="1" rowspan="167" style="background-color: #dddcb1; width:.8%;"></th><th colspan="5" rowspan="1" style="width:12.5%;"> [[World_5:_%E5%8D%97%E6%96%B9%E6%B5%B7%E5%9F%9F | World 5]]</th><th colspan="1" rowspan="167" style="background-color: #dddcb1; width:.8%;"></th><th colspan="4" rowspan="1" style="width:10%;"> [[World_6:_%E4%B8%AD%E9%83%A8%E6%B5%B7%E5%9F%9F | World 6]]</th><th colspan="1" rowspan="167" style="background-color: #dddcb1; width:.8%;"></th><th colspan="1" rowspan="2" style="width:14%;"> Remarks</th></tr><tr><th style="width:2.5%;"> [[World_1:_%E9%8E%AE%E5%AE%88%E5%BA%9C%E6%B5%B7%E5%9F%9F#Drops | 1]]</th><th style="width:2.5%;"> [[World_1:_%E9%8E%AE%E5%AE%88%E5%BA%9C%E6%B5%B7%E5%9F%9F#Drops_2 | 2]]</th><th style="width:2.5%;"> [[World_1:_%E9%8E%AE%E5%AE%88%E5%BA%9C%E6%B5%B7%E5%9F%9F#Drops_3 | 3]]</th><th style="width:2.5%;"> [[World_1:_%E9%8E%AE%E5%AE%88%E5%BA%9C%E6%B5%B7%E5%9F%9F#Drops_4 | 4]]</th><th style="width:2.5%;"> [[World_1:_%E9%8E%AE%E5%AE%88%E5%BA%9C%E6%B5%B7%E5%9F%9F#Drops_5 | 5]]</th><th style="width:2.5%;"> [[World_1:_%E9%8E%AE%E5%AE%88%E5%BA%9C%E6%B5%B7%E5%9F%9F#Drops_6 | 6]]</th><th style="width:2.5%;"> [[World_2:_%E5%8D%97%E8%A5%BF%E8%AB%B8%E5%B3%B6%E6%B5%B7%E5%9F%9F#Drops | 1]]</th><th style="width:2.5%;"> [[World_2:_%E5%8D%97%E8%A5%BF%E8%AB%B8%E5%B3%B6%E6%B5%B7%E5%9F%9F#Drops_2 | 2]]</th><th style="width:2.5%;"> [[World_2:_%E5%8D%97%E8%A5%BF%E8%AB%B8%E5%B3%B6%E6%B5%B7%E5%9F%9F#Drops_3 | 3]]</th><th style="width:2.5%;"> [[World_2:_%E5%8D%97%E8%A5%BF%E8%AB%B8%E5%B3%B6%E6%B5%B7%E5%9F%9F#Drops_4 | 4]]</th><th style="width:2.5%;"> [[World_2:_%E5%8D%97%E8%A5%BF%E8%AB%B8%E5%B3%B6%E6%B5%B7%E5%9F%9F#Drops_5 | 5]]</th><th style="width:2.5%;"> [[World_3:_%E5%8C%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops | 1]]</th><th style="width:2.5%;"> [[World_3:_%E5%8C%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_2 | 2]]</th><th style="width:2.5%;"> [[World_3:_%E5%8C%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_3 | 3]]</th><th style="width:2.5%;"> [[World_3:_%E5%8C%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_4 | 4]]</th><th style="width:2.5%;"> [[World_3:_%E5%8C%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_5 | 5]]</th><th style="width:2.5%;"> [[World_4:_%E8%A5%BF%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops | 1]]</th><th style="width:2.5%;"> [[World_4:_%E8%A5%BF%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_2 | 2]]</th><th style="width:2.5%;"> [[World_4:_%E8%A5%BF%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_3 | 3]]</th><th style="width:2.5%;"> [[World_4:_%E8%A5%BF%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_4 | 4]]</th><th style="width:2.5%;"> [[World_5:_%E5%8D%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops | 1]]</th><th style="width:2.5%;"> [[World_5:_%E5%8D%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_2 | 2]]</th><th style="width:2.5%;"> [[World_5:_%E5%8D%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_3 | 3]]</th><th style="width:2.5%;"> [[World_5:_%E5%8D%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_4 | 4]]</th><th style="width:2.5%;"> [[World_5:_%E5%8D%97%E6%96%B9%E6%B5%B7%E5%9F%9F#Drops_5 | 5]]</th><th style="width:2.5%;"> [[World_6:_%E4%B8%AD%E9%83%A8%E6%B5%B7%E5%9F%9F#Drops | 1]]</th><th style="width:2.5%;"> [[World_6:_%E4%B8%AD%E9%83%A8%E6%B5%B7%E5%9F%9F#Drops_2 | 2]]</th><th style="width:2.5%;"> - </th><th style="width:2.5%;"> - </th></tr>'
    if frame.args[1] ~= "all" then
        for i,shipName in pairs(frame.args) do
            html = html .. p.formatShipDropTable(dropList[shipName])
        end
    end
    if frame.args[1] == "all" then
        local ordered_keys = {}
        for k in pairs(dropList) do
            table.insert(ordered_keys, k)
        end
        table.sort(ordered_keys)
        for i = 1, #ordered_keys do
            local shipName = ordered_keys[i]
            --return shipName
            html = html .. p.formatShipDropTable(dropList[shipName])
        end
    end
    html = html .. "</table>"
    return html
end

return p