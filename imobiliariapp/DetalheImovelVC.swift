//
//  DetalheImovelVC.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 20/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

class DetalheImovelVC : UIViewController{
    
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var descricao: UITextView!
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var uso: UILabel!
    @IBOutlet weak var valor: UILabel!
    @IBOutlet weak var endereco: UILabel!
    @IBOutlet weak var bairro: UILabel!
    @IBOutlet weak var suites: UILabel!
    @IBOutlet weak var quartos: UILabel!
    @IBOutlet weak var banheiros: UILabel!
    @IBOutlet weak var garagens: UILabel!
    @IBOutlet weak var area: UILabel!
    
    var imovel : Imovel!
    
    override func viewDidLoad() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .ScaleAspectFit
        
        let image = UIImage(named: "titulo")
        imageView.image = image
        
        navigationItem.titleView = imageView
        navigationItem.backBarButtonItem?.title = "Voltar"
        
        descricao.contentInset = UIEdgeInsetsMake(-6,0,0,0);
        
        carregaDados()
    }
    
    func carregaDados(){
        titulo.text = imovel.titulo
        WebService.carregaImagem(imagem, idImovel: imovel.id, nome: imovel.getFotoPrincipal().getNome(TipoFotoImovel.grande))
        descricao.text = imovel.descricao
        
        tipo.text = imovel.tipoImovel.getData()
        uso.text = imovel.tipoUso.getData()
        valor.text = "R$ " + String(imovel.valor)
        endereco.text = "\(imovel.endereco) - \(imovel.numero)"
        bairro.text = imovel.bairro
        suites.text = String(imovel.suites)
        quartos.text = String(imovel.quartos)
        banheiros.text = String(imovel.banheiros)
        garagens.text = String(imovel.garagens)
        area.text = String(imovel.areaInterna) + "m²"
    }
}