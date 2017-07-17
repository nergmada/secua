return function(path)
  return {
    log = require((path .. '/errorlog')),
    keycomparator = (require((path .. '/keycomparator')))(path)
  }
end
