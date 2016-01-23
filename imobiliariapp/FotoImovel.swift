//
//  FotoImovel.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 19/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

class FotoImovel{
    var id : Int!
    var nome : String!
    var aprovada : Bool!
    var principal : Bool!
    
    init(dados : NSDictionary){
        id = Util.getIntFromJSON(dados, key: "id")
        nome = Util.getStringFromJSON(dados, key: "nome")
        aprovada = dados["aprovada"] as! Bool
        principal = dados["principal"] as! Bool
    }
    
    func getNome(tamanho : TipoFotoImovel) -> String{
        let nomeArray = nome.characters.split(isSeparator: {$0 == "."}).map(String.init)
        
        return "\(nomeArray[0])_\(tamanho.getData()).\(nomeArray[1])"
    }
}