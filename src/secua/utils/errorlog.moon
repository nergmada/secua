return (data, errorlevel) ->
    switch errorlevel
        when 1
            print 'Error: ' .. data
        when 2
            print 'Warning: ' .. data
        when 3
            print 'Message: ' .. data