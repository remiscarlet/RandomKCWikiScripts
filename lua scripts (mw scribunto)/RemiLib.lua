local p = {}

local bit32 = require( 'bit32' )

-- Module for random library functions for lua because lua sucks. Written by
-- Remi_Scarlet
-- I fucking hate lua.

-- Takes a table. Returns a bool of whether it's empty or not.
function table.empty (self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end

-- takes a string and returns string with first letter capitalized
function p.capitalize(str)
    return (str:gsub("^%l", string.upper))
end

function p.hashString(str)
    local hash = 0
    if str == nil or str == "" then
        return 0
    end
    if type(str) == "string" and str ~= "" then
        for i = 1, #str do
            local letter = str:sub(i,i)
            hash = bit32.lshift(hash,3)
            hash = hash+str.byte(letter) % (2^31-1)
        end
    end
    return hash
end


-- Hashes a seed if given, if not just returns a hash based on current time.
function p.timeHash(seed)
    local randomizer = 0
        
    if seed == nil then
        randomizer = math.random(0,9999999)
    elseif type(seed) == "table" then
        if table.empty(seed) then
            randomizer = math.random(0,9999999)
        else
            for k,v in pairs(seed) do
                if type(k) == "number" then
                    randomizer = randomizer + k
                elseif type(k) == "string" then
                    randomizer = randomizer + p.hashString(k)
                end
                if type(v) == "string" then
                    randomizer = randomizer + p.hashString(v)
                elseif type(v) == "number" then
                    randomizer = randomizer + v
                elseif type(v) == "table" then
                    local tableString = p.dictConcat(v)
                    randomizer = randomizer + p.hashString(v)
                end
            end
        end
    elseif type(seed) == "string" then
        randomizer = p.hashString(seed)
    elseif type(seed) == "number" then
        randomizer = seed
    end
    local time = os.time()
    local rand = math.random()
    local rtnHash = (math.floor(time*5501*rand)-math.floor(randomizer*time) + math.floor(math.random()*5501*randomizer)) % 2^32
    return rtnHash
end

-- returns a string representation of a table.
-- cannot do recursive tables. Eg, only single dimensional tables will work
-- should a multi-dimensional table be given, it will simply put "table" as the value
function p.dictConcat(dict,sep)
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

-- returns tables merged. 
function p.mergeTable(t1,t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                tableMerge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

-- Assumes a1 and a2 are "arrays" with their keys being ints in increasing order from 1
-- returns array with a2's indexes being appended to a1 in order
function p.mergeArrays(a1,a2)
    local len = #a1
    for i,v in pairs(a2) do
        a1[len+i] = v
    end
    return a1
end

p.lowercase = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
p.uppercase = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
p.letters = p.mergeArrays(p.lowercase,p.uppercase)


-- checks if data is in the array as a key
function p.valid(data, array)
    local valid = {}
    if array ~= nil then
        for i = 1, #array do
            valid[array[i]] = true
        end
        if valid[data] then
            return true
        else
            return false
        end
    end
end

-- returns number of elements and tables there are.
-- recurse parameter is a boolean on whether to recurse on tables
function p.getTableSize(table, recurse)
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

return p
