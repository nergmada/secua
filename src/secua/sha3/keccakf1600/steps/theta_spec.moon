describe 'theta step tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly transforms a given state according to theta', ->
        hexBytify = secua.utils.hexBytify
        theta_input = {
            [0]: {
                [0]: hexBytify '8030500001E0840C',
                hexBytify '00049840D3042220',
                hexBytify '0000A50434031950',
                hexBytify '01840C580E382590',
                hexBytify '80859C8008192199',
            }, {
                [0]: hexBytify '38CA983082300106',
                hexBytify '11932210B0700202',
                hexBytify '003E0038090A8080',
                hexBytify '3E08505001060000',
                hexBytify 'C700080080E020E2',
            }, {
                [0]: hexBytify '08B0340041C14101',
                hexBytify '40038E20070020F0',
                hexBytify 'C400828E0C100043',
                hexBytify '040C0061063A6584',
                hexBytify '008584804017321C',
            }, {
                [0]: hexBytify '2002783081A00483',
                hexBytify '31953040D0600010',
                hexBytify '0022263021081812',
                hexBytify '39801C4809030010',
                hexBytify '4100180008E801A1',
            }, {
                [0]: hexBytify '10488C0040D14100',
                hexBytify '60030C30241400C2',
                hexBytify 'C41C018A18108081',
                hexBytify '0A08402100074184',
                hexBytify '06000C00C0063266',
            }
        }

        expected = {
            [0]: {
                [0]: hexBytify '98B0590AC86D7060',
                hexBytify '1884914A1A89D64C',
                hexBytify '1880AC0EFD8EED3C',
                hexBytify '19040552C7B5D1FC',
                hexBytify '9805958AC194D5F5',
            }, {
                [0]: hexBytify '298A1D327B0ED626',
                hexBytify '00D3A712494ED522',
                hexBytify '117E853AF03457A0',
                hexBytify '2F48D552F838D720',
                hexBytify 'D6408D0279DEF7C2',
            }, {
                [0]: hexBytify '0AB50258192BD807',
                hexBytify '4206B8785FEAB9F6',
                hexBytify 'C605B4D654FA9945',
                hexBytify '060936395ED0FC82',
                hexBytify '0280B2D818FDAB1A',
            }, {
                [0]: hexBytify 'D8875F48F4F557EA',
                hexBytify 'C9101738A5355379',
                hexBytify 'F8A70148545D4B7B',
                hexBytify 'C1053B307C565379',
                hexBytify 'B9853F787DBD52C8',
            }, {
                [0]: hexBytify '7B161D31F07F2ADA',
                hexBytify '0B5D9D0194BA6B18',
                hexBytify 'AF4290BBA8BEEB5B',
                hexBytify '6156D110B0A92A5E',
                hexBytify '6D5E9D3170A859BC',
            }
        }
        assert.are.same expected, secua.sha3.steps.theta theta_input