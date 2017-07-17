return function(data, errorlevel)
  local _exp_0 = errorlevel
  if 1 == _exp_0 then
    return print('Error: ' .. data)
  elseif 2 == _exp_0 then
    return print('Warning: ' .. data)
  elseif 3 == _exp_0 then
    return print('Message: ' .. data)
  end
end
