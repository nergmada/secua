return function(path)
  return {
    keyschedule = (require(path .. '/keyschedule'))(path .. '/keyschedule')
  }
end
