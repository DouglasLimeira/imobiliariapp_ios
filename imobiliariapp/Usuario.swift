//
//  Usuario.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 17/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

class Usuario{
    var id : Int!
    var senha : String!
    var nome : String!
    var sobrenome : String!
    var cpf : String!
    var email : String!
    var telefone : String!
    var ativo : Bool!
    var dataNascimento : NSDate!
    
    var tipoUsuario : TipoUsuario!
    var creci : String!
    var foto : String!
    var aprovado : Bool!
    var funcionario : Bool!
    var aceitoTermosUso : Bool!
}