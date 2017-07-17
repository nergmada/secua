return function(path)
  local log = (require(path .. '/errorlog'))
  return function(keyA, keyB)
    if (not keyA) or (not keyB) then
      log('No value supplied for at least one parameter', 1)
      return false
    end
    if (type(keyA)) == 'table' and (type(keyB)) == 'table' then
      if #keyA == #keyB then
        for i = 1, #keyA do
          if keyA[i] ~= keyB[i] then
            return false
          end
        end
        return true
      else
        return false
      end
    elseif (type(keyA)) == 'string' and (type(keyB)) == 'string' then
      if keyA == keyB then
        return true
      else
        return false
      end
    else
      log('Invalid value supplied for at least one parameter', 1)
      return false
    end
  end
end
