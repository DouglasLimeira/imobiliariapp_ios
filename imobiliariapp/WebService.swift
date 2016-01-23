//
//  WebService.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 19/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation
import Alamofire

class WebService{
    static func carregaImagem(imageView : UIImageView, idImovel : Int, nome : String){
        Alamofire.request(.GET, "http://localhost:8080/imoveis/service/imoveis/getImagem/\(String(idImovel))/\(nome)").responseData{ response in
            if let data = response.result.value {
                imageView.image = UIImage(data: data)
            }
        }
    }
}
