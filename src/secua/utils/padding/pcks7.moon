return (path) ->
    log = require path .. '/utils/errorlog'
    return {
        pad: (data, desiredlength) ->
            if (not desiredlength) or (not data) or (type data) != 'table' or (type desiredlength) != 'number' 
                log 'provided data or length is non existent or type is not correct', 1
                return nil
            if (#data % desiredlength != 0)
                required = desiredlength - (#data % desiredlength)
                result = {}
                for i = 1, #data
                    result[i] = data[i]
                for i = 1, required
                    table.insert result, required
                return result
            return data
        depad: (data) ->
            if (not data) or (type data) != 'table' 
                log 'provided data is non existent or type is not correct', 1
                return nil
            padLength = data[#data]
            for i = 0, (padLength - 1)
                if data[#data - i] != padLength
                    return data
            result = {}
            for i = 1, #data - (padLength)
                result[i] = data[i]
            return result
    }