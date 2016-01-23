//
//  TipoImovel.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 17/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

enum TipoImovel{
    case apartamento
    case area
    case bangalo
    case casa
    case chacara
    case chale
    case clinica
    case clube
    case cobertura
    case condResidencial
    case duplex
    case empreendimentos
    case fazenda
    case flat
    case galpao
    case granja
    case hotel
    case kitnet
    case lancamento
    case loja
    case mercadinho
    case pontoComercial
    case postoCombustivel
    case pousada
    case predioComercial
    case restaurante
    case rural
    case salaComercial
    case salao
    case sitio
    case sobrado
    case terreno
    case terrenoCondominio
    
    static func getKey(var data : String) -> TipoImovel!{
        data = data.lowercaseString
        switch (data){
            case "apartamento" : return .apartamento
            case "area" : return .area
            case "bangalo" : return .bangalo
            case "casa" : return .casa
            case "chacara" : return .chacara
            case "chale" : return .chale
            case "clinica" : return .clinica
            case "clube" : return .clube
            case "cobertura" : return .cobertura
            case "cond. residêncial" : return .condResidencial
            case "duplex" : return .duplex
            case "empreendimentos" : return .empreendimentos
            case "fazenda" : return .fazenda
            case "flat" : return .flat
            case "galpão" : return .galpao
            case "granja" : return .granja
            case "hotel" : return .hotel
            case "kitnet" : return .kitnet
            case "lançamento" : return .lancamento
            case "loja" : return .loja
            case "mercadinho" : return .mercadinho
            case "ponto comercial" : return .pontoComercial
            case "posto combustível" : return .postoCombustivel
            case "pousada" : return .pousada
            case "predio comercial" : return .predioComercial
            case "restaurante" : return .restaurante
            case "rural" : return .rural
            case "sala comercial" : return .salaComercial
            case "salão" : return .salao
            case "sítio" : return .sitio
            case "sobrado" : return .sobrado
            case "terreno" : return .terreno
            case "terreno condominio" : return .terrenoCondominio
            default : return nil
        }
    }
    
    func getData() -> String{
        switch (self){
            case .apartamento : return "Apartamento"
            case .area : return "Área"
            case .bangalo : return "Bangalo"
            case .casa : return "Casa"
            case .chacara : return "Chácara"
            case .chale : return "Chalé"
            case .clinica : return "Clínica"
            case .clube : return "Clube"
            case .cobertura : return "Cobertura"
            case .condResidencial : return "Condomínio Residencial"
            case .duplex : return "Dúplex"
            case .empreendimentos : return "Empreendimentos"
            case .fazenda : return "Fazenda"
            case .flat : return "Flat"
            case .galpao : return "Galpão"
            case .granja : return "Granja"
            case .hotel : return "Hotel"
            case .kitnet : return "Kitnet"
            case .lancamento : return "Lançamento"
            case .loja : return "Loja"
            case .mercadinho : return "Mercadinho"
            case .pontoComercial : return "Ponto Comercial"
            case .postoCombustivel : return "Posto de Combustível"
            case .pousada : return "Pousada"
            case .predioComercial : return "Prédio Comercial"
            case .restaurante : return "Restaurante"
            case .rural : return "Rural"
            case .salaComercial : return "Sala Comercial"
            case .salao : return "Salão"
            case .sitio : return "Sítio"
            case .sobrado : return "Sobrado"
            case .terreno : return "Terreno"
            case .terrenoCondominio : return "Terreno Condomínio"
        }
    }
    
    static func allData() -> [String]{
        var array = [String]()
        
        array.append(TipoImovel.apartamento.getData())
        array.append(TipoImovel.area.getData())
        array.append(TipoImovel.bangalo.getData())
        array.append(TipoImovel.casa.getData())
        array.append(TipoImovel.chacara.getData())
        array.append(TipoImovel.chale.getData())
        array.append(TipoImovel.clinica.getData())
        array.append(TipoImovel.clube.getData())
        array.append(TipoImovel.cobertura.getData())
        array.append(TipoImovel.condResidencial.getData())
        array.append(TipoImovel.duplex.getData())
        array.append(TipoImovel.empreendimentos.getData())
        array.append(TipoImovel.fazenda.getData())
        array.append(TipoImovel.flat.getData())
        array.append(TipoImovel.galpao.getData())
        array.append(TipoImovel.granja.getData())
        array.append(TipoImovel.hotel.getData())
        array.append(TipoImovel.kitnet.getData())
        array.append(TipoImovel.lancamento.getData())
        array.append(TipoImovel.loja.getData())
        array.append(TipoImovel.mercadinho.getData())
        array.append(TipoImovel.pontoComercial.getData())
        array.append(TipoImovel.postoCombustivel.getData())
        array.append(TipoImovel.pousada.getData())
        array.append(TipoImovel.predioComercial.getData())
        array.append(TipoImovel.restaurante.getData())
        array.append(TipoImovel.rural.getData())
        array.append(TipoImovel.salaComercial.getData())
        array.append(TipoImovel.salao.getData())
        array.append(TipoImovel.sitio.getData())
        array.append(TipoImovel.sobrado.getData())
        array.append(TipoImovel.terreno.getData())
        array.append(TipoImovel.terrenoCondominio.getData())
        
        return array
    }
}