//
//  PosicaoSol.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 17/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

enum PosicaoSol{
    case nascente
    case poente
    case perpendicular
    
    func getData() -> String{
        switch (self){
            case .nascente : return "Nascente"
            case .poente : return "Poente"
            case .perpendicular : return "Perpendicular"
        }
    }
    
    static func getKey(var data : String) -> PosicaoSol!{
        data = data.lowercaseString
        switch (data){
            case "nascente" : return .nascente
            case "poente" : return .poente
            case "perpendicular" : return .perpendicular
            default : return nil
        }
    }
}