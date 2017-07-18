return (data, errorlevel) ->
    switch errorlevel
        when 1
            print 'Error@Secua: ' .. data
        when 2
            print 'Warning@Secua: ' .. data
        when 3
            print 'Message@Secua: ' .. data