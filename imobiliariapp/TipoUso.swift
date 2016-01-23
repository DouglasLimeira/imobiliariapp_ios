//
//  TipoUso.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 17/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

enum TipoUso{
    case novo
    case usado
    case construcao
    case lancamento
    
    func getData() -> String{
        switch (self){
            case .novo : return "Novo"
            case .usado : return "Usado"
            case .construcao : return "Construção"
            case .lancamento : return "Lançamento"
        }
    }
    
    static func getKey(var data : String) -> TipoUso!{
        data = data.lowercaseString
        switch (data){
            case "novo" : return .novo
            case "usado" : return .usado
            case "construcao" : return .construcao
            case "lancamento" : return .lancamento
            default : return nil
        }
    }
}