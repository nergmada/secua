return function(path)
  local bit = require('bit')
  local sbox = require(path .. '/sbox')
  local rcon = require(path .. '/rcon')
  local keyScheduleCore
  keyScheduleCore = function(input, iteration)
    local output = { }
    output[1], output[2], output[3], output[4] = sbox[input[2]], sbox[input[3]], sbox[input[4]], sbox[input[1]]
    output[1] = bit.bxor(output[1], rcon[iteration])
    return output
  end
  return function(key)
    local expandedKey = { }
    local n, b = nil, nil
    if #key == 128 / 8 then
      n, b = 16, 176
    elseif #key == 192 / 8 then
      n, b = 24, 208
    elseif #key == 256 / 8 then
      n, b = 32, 240
    else
      print('Error')
      return nil
    end
    for i = 1, #key do
      expandedKey[i] = key[i]
    end
    local rconi = 1
    while #expandedKey ~= b do
      local t
      do
        local _accum_0 = { }
        local _len_0 = 1
        for _index_0 = #expandedKey - 3, #expandedKey do
          local byte = expandedKey[_index_0]
          _accum_0[_len_0] = byte
          _len_0 = _len_0 + 1
        end
        t = _accum_0
      end
      t = keyScheduleCore(t, rconi)
      rconi = rconi + 1
      for j = 1, 4 do
        for i = 1, 4 do
          t[i] = bit.bxor(t[i], expandedKey[(#expandedKey + 1) - n])
          table.insert(expandedKey, t[i])
        end
      end
      if #key == 256 / 8 then
        for i = 1, 4 do
          t[i] = sbox[t[i]]
          t[i] = bit.bxor(t[i], expandedKey[(#expandedKey + 1) - n])
          table.insert(expandedKey, t[i])
        end
      end
      if #key == 192 / 8 then
        for j = 1, 2 do
          for i = 1, 4 do
            t[i] = bit.bxor(t[i], expandedKey[(#expandedKey + 1) - n])
            table.insert(expandedKey, t[i])
          end
        end
      elseif #key == 256 / 8 then
        for j = 1, 3 do
          for i = 1, 4 do
            t[i] = bit.bxor(t[i], expandedKey[(#expandedKey + 1) - n])
            table.insert(expandedKey, t[i])
          end
        end
      end
    end
    return expandedKey
  end
end
