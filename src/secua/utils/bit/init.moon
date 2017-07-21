return (path) ->
    standard = require (path .. '/utils/bit/standard')
    functions = {}
    for name, funct in pairs standard
        functions[name] = funct
    return functions