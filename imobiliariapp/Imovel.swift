//
//  Imovel.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 17/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

class Imovel{
    var id : Int!
    
    var titulo : String!
    var cep : String!
    var endereco : String!
    var numero : String!
    var bairro : String!
    var cidade : String!
    var estado : String!
    var complemento : String!
    
    var corretor : Usuario!
    var tipoImovel : TipoImovel!
    var tipoUso : TipoUso!
    
    var aprovado : Bool!
    var ativo : Bool!
    
    var quartos : Int!
    var suites : Int!
    var banheiros : Int!
    var garagens : Int!
    var elevador : Int!
    var areaLazer : Bool!
    var areaInterna : Float!
    var valor : Float!
    var andar : Int!
    
    var posicaoSol : PosicaoSol!
    var fotos : [FotoImovel] = [FotoImovel]()
    var destaque : Bool!
    
    var construtora : String!
    var descricao : String!
    var comentarioCorretor : String!
    
    init (dados : NSDictionary){
        id = dados["id"] as! Int
        
        titulo = Util.getStringFromJSON(dados, key: "titulo")
        cep = Util.getStringFromJSON(dados, key: "cep")
        endereco = Util.getStringFromJSON(dados, key: "endereco")
        numero = Util.getStringFromJSON(dados, key: "numero")
        bairro = Util.getStringFromJSON(dados, key: "bairro")
        cidade = Util.getStringFromJSON(dados, key: "cidade")
        estado = Util.getStringFromJSON(dados, key: "estado")
        complemento = Util.getStringFromJSON(dados, key: "complemento")
        
        var aux : String!
        
        //corretor = Usuario(dados["corretor"])
        
        aux = dados["tipoImovel"] as! String
        tipoImovel = TipoImovel.getKey(aux)
        
        aux = dados["tipoUso"] as! String
        tipoUso = TipoUso.getKey(aux)
        
        aprovado = dados["aprovado"] as! Bool
        ativo = dados["ativo"] as! Bool
        
        quartos = Util.getIntFromJSON(dados, key: "quartos")
        suites = Util.getIntFromJSON(dados, key: "suites")
        banheiros = Util.getIntFromJSON(dados, key: "banheiros")
        garagens = Util.getIntFromJSON(dados, key: "garagens")
        elevador = Util.getIntFromJSON(dados, key: "elevador")
        areaInterna = dados["areaInterna"] as! Float
        valor = dados["valor"] as! Float
        andar = Util.getIntFromJSON(dados, key: "andar")
        
        areaLazer = dados["areaLazer"] as! Bool
        
        aux = dados["posicaoSol"] as! String
        posicaoSol = PosicaoSol.getKey(aux)
        
        for fotoArray in dados["fotos"] as! NSArray{
            let foto : FotoImovel = FotoImovel(dados: fotoArray as! NSDictionary)
            fotos.append(foto)
        }
        
        destaque = dados["destaque"] as! Bool
        
        construtora = Util.getStringFromJSON(dados, key: "construtora")
        descricao = Util.getStringFromJSON(dados, key: "descricao")
        comentarioCorretor = Util.getStringFromJSON(dados, key: "comentarioCorretor")
    }
    
    func getFotoPrincipal() -> FotoImovel{
        var fotoPrincipal = fotos[0]
        for foto in fotos{
            if (foto.principal != nil && foto.principal == true){
                fotoPrincipal = foto
            }
        }
        
        return fotoPrincipal
    }
}