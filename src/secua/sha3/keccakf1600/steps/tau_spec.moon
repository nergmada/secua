describe 'Tau step tests', ->
    secua = nil
    
    setup ->
        secua = (require 'secua')('secua')
    
    before_each ->
        stub _G, "print"
    
    it 'correctly transforms a given state according to tau', ->
        hexBytify = secua.utils.hexBytify
        tau_input = {
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
        expected = {
            [0]: {
                [0]: hexBytify '0838573A4DEB6243',
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
        result = secua.sha3.steps.tau tau_input, { 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x80, 0x00 }
        assert.are.same expected, result