//
//  TipoUsuario.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 17/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

enum TipoUsuario{
    case cliente
    case construtor
    case corretor
    
    func getData() -> String{
        switch (self){
            case .cliente : return "Cliente"
            case .construtor : return "Construtor"
            case .corretor : return "Corretor"
        }
    }
    
    static func getKey(var data : String) -> TipoUsuario!{
        data = data.lowercaseString
        switch (data){
            case "cliente" : return .cliente
            case "construtor" : return .construtor
            case "corretor" : return .corretor
            default : return nil
        }
    }
}