//
//  ListaConstrucaoVC.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 19/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation
import Alamofire

class ListaConstrucaoVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var imoveisConstrucao = [Imovel]()
    var params = ParametrosPesquisa()
    
    override func viewDidLoad() {
        let tabView = tabBarController as! ListaTBC
        params = tabView.params
        
        carregaListaConstrucao()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detalheImovel"){
            let view = segue.destinationViewController as! DetalheImovelVC
            view.imovel = imoveisConstrucao[(collectionView.indexPathsForSelectedItems()?.first?.row)!]
        }
    }
    
    func carregaListaConstrucao(){
        Alamofire.request(.GET, "http://localhost:8080/imoveis/service/imoveis/selectImoveisConstrucao/\(params.tipoImovel)/\(params.bairro)/\(params.quartoMenor)/\(params.quartoMaior)/\(params.garagemMenor)/\(params.garagemMaior)/\(params.areaMenor)/\(params.areaMaior)/\(params.valorMenor)/\(params.valorMaior)")
            .responseJSON { response in
                if let JSON = response.result.value {
                    let arrayJSON : NSArray = JSON as! NSArray
                    for imovelJSON in arrayJSON{
                        let dados : NSDictionary = imovelJSON as! NSDictionary
                        let imovel : Imovel = Imovel(dados: dados)
                        
                        self.imoveisConstrucao.append(imovel)
                    }
                    self.collectionView.reloadData()
                }
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imoveisConstrucao.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath)
        
        let imovel = imoveisConstrucao[indexPath.row]
        
        let imagem = cell.viewWithTag(1) as! UIImageView
        WebService.carregaImagem(imagem, idImovel: imovel.id, nome: imovel.getFotoPrincipal().getNome(TipoFotoImovel.medio))
        
        let bairro = cell.viewWithTag(2) as! UILabel
        bairro.text = imovel.bairro
        
        let suites = cell.viewWithTag(3) as! UILabel
        suites.text = String(imovel.suites)
        
        let quartos = cell.viewWithTag(4) as! UILabel
        quartos.text = String(imovel.quartos)
        
        let banheiros = cell.viewWithTag(5) as! UILabel
        banheiros.text = String(imovel.banheiros)
        
        let garagens = cell.viewWithTag(6) as! UILabel
        garagens.text = String(imovel.garagens)
        
        let tamanho = cell.viewWithTag(7) as! UILabel
        tamanho.text = String(imovel.areaInterna)
        
        return cell
    }
    
}
