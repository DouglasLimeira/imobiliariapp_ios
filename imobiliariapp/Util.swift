//
//  Util.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 19/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

class Util{
    static let serverLocation = "http://localhost:8080/imoveis/service"
    
    static func getStringFromJSON(data : NSDictionary, key : String) -> String{
        if let info = data[key] as? String{
            return info
        }
        return ""
    }
    
    static func getIntFromJSON(data : NSDictionary, key : String) -> Int!{
        if data[key] is NSNull{
            return 0
        }
        else{
            return data[key] as! Int
        }
    }
    
    static func putBorda(botao : UIButton, cor : UIColor, tamanho : Float){
        botao.layer.borderWidth = CGFloat(tamanho)
        botao.layer.borderColor = cor.CGColor
    }
    
    static func putBorda(collection : UICollectionView, cor : UIColor, tamanho : Float){
        collection.layer.borderWidth = CGFloat(tamanho)
        collection.layer.borderColor = cor.CGColor
    }
}