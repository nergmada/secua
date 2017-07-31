describe 'Rho, Pi and Chi step tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly transforms a given state according to Rho Pi and Chi', ->
        hexBytify = secua.utils.hexBytify
        rho_input = {
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
        chi_input = {
            [0]: {
                [0]: hexBytify '98B0590AC86D7060',
                hexBytify '8F4F557EAD8875F4',
                hexBytify '53143A64F61DAC4C',
                hexBytify '8F83F956D3D8B0E9',
                hexBytify 'C2AD4096064AF601',
            }, {
                [0]: hexBytify 'ED52200D3A712494',
                hexBytify 'D0194BA6B180B5D9',
                hexBytify '81AE1E17FAAE7D90',
                hexBytify 'A89D64C1884914A1',
                hexBytify 'BCE4880B9C529AA9',
            }, {
                [0]: hexBytify 'D4CA2E302DA6B2A7',
                hexBytify 'C4056077EC7769E0',
                hexBytify '90A8BA96F7F14E02',
                hexBytify 'FA14EBC0D15E8045',
                hexBytify '5F75ADD7A1485DD4',
            }, {
                [0]: hexBytify '660F8ACA6F3820A7',
                hexBytify '1AE405E91AAA5F07',
                hexBytify '56D110B0A92A5E61',
                hexBytify '9B1CAF687E410304',
                hexBytify '6BA3F832080AA58F',
            }, {
                [0]: hexBytify 'A74C5C2A166F1B57',
                hexBytify '4050165B031FB563',
                hexBytify '562B065357D66016',
                hexBytify 'C8B9853F787DBD52',
                hexBytify '59023409E77BDF0B',
            }
        }
        expected = {
            [0]: {
                [0]: hexBytify '8838573ACDEBE243',
                hexBytify '8B4B752FE1FF3DD4',
                hexBytify '43149AE4F34CAE4E',
                hexBytify 'DD83725682CE30AD',
                hexBytify '81BC65422742B355',
            }, {
                [0]: hexBytify 'CF57A0C778692494',
                hexBytify 'CAF94E2EA308A3DE',
                hexBytify 'C7FF1E37F2A46DF1',
                hexBytify 'A99560E9A64817A1',
                hexBytify '9C66D82B94503AA2',
            }, {
                [0]: hexBytify '558A7A103DE1A9F7',
                hexBytify '84157265ED62C980',
                hexBytify '9082BCD5A1256E14',
                hexBytify 'BAB5EBD7D1623C17',
                hexBytify '4F75A9DE463907D4',
            }, {
                [0]: hexBytify '7EBF8BCAA7384087',
                hexBytify '95EB44CDB62A1F93',
                hexBytify '57C528940923D229',
                hexBytify '9C1ED728FDC103AD',
                hexBytify 'E90EB8A4080A858F',
            }, {
                [0]: hexBytify 'C20E7C2F247F1FC3',
                hexBytify '10401CDB131F356A',
                hexBytify 'D68102405F743186',
                hexBytify 'E8A581BE707CB952',
                hexBytify '6542BC007F6BD7A3',
            }
        }
        rhopi, chi = secua.sha3.steps.rhopi, secua.sha3.steps.chi
        assert.are.same expected, chi chi_input, (rhopi rho_input)