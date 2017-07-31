return (path) ->
    standard = require (path .. '/utils/bit/standard')
    functions = {
        getBit: (require path .. '/utils/bit/getBit')(path)
        setBit: (require path .. '/utils/bit/setBit')(path)
    }
    for name, funct in pairs standard
        functions[name] = funct
    return functions