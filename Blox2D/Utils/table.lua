local t = table
table = {}
table.find = function(tbl, value)
    Check("find", "table", tbl, "table")
    assert(value ~= nil, "table.find argument 2 is nil")
    local i = #tbl
    while (i > 0 and tbl[i] ~= value) do
        i = i - 1
    end
    if i == 0 then
        return
    else
        return i
    end
end
table.unpack = unpack
table.pack = function (...)
    local args = {...}
    return args
end
table.getn = function()
    return #table
end
table.create = function (count, value)
    Check("create", "number", count, "count")
    assert(value ~= nil, "table.create argument 2 is nil")
    local tbl = {}
    for i = 1, count do
        tbl[i] = value
    end
    return tbl
end
table.print = function(tbl)
    Check("print", "table", tbl, "tbl")
    print("{")
    for i, v in pairs(tbl) do
        print(i,v)
    end
    print("}")
end

setmetatable(table, {
    __index = function (tbl, index)
        return t[index]
    end
})