//
//  TipoFotoImovel.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 19/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

enum TipoFotoImovel{
    case original
    case grande
    case medio
    case pequeno
    
    func getAltura() -> Int{
        switch (self){
            case .original : return 0
            case .grande : return 620
            case .medio : return 310
            case .pequeno : return 170
        }
    }
    
    func getLargura() -> Int{
        switch (self){
            case .original : return 0
            case .grande : return 1000
            case .medio : return 500
            case .pequeno : return 275
        }
    }
    
    static func getKey(var data : String) -> TipoFotoImovel{
        data = data.lowercaseString
        switch (data){
            case "original" : return .original
            case "grande" : return .grande
            case "medio" : return .medio
            case "pequeno" : return .pequeno
            default : return .original
        }
    }
    
    func getData() -> String{
        switch (self){
            case .original : return ""
            case .grande : return "GRANDE"
            case .medio : return "MEDIO"
            case .pequeno : return "PEQUENO"
        }
    }
}