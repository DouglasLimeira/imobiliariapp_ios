//
//  InicioVC.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 10/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation
import Alamofire

class InicioVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var btMenu: UIBarButtonItem!
    @IBOutlet weak var listaDestaque: UICollectionView!
    
    var imoveisDestaque = [Imovel]()
    
    override func viewDidLoad() {
        btMenu.target = self.revealViewController()
        btMenu.action = Selector("revealToggle:")
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .ScaleAspectFit
        
        let image = UIImage(named: "titulo")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        carregaListaDestaque()
    }
    
    func carregaListaDestaque(){
        Alamofire.request(.GET, "http://localhost:8080/imoveis/service/imoveis/selectAllImoveisDestaques")
            .responseJSON { response in
                if let JSON = response.result.value {
                    let arrayJSON : NSArray = JSON as! NSArray
                    for imovelJSON in arrayJSON{
                        let dados : NSDictionary = imovelJSON as! NSDictionary
                        let imovel : Imovel = Imovel(dados: dados)
                        
                        self.imoveisDestaque.append(imovel)
                    }
                    self.listaDestaque.reloadData()
                }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "listaImoveis"){
            let navigationController = segue.destinationViewController as! UINavigationController
            let newView = navigationController.viewControllers.first as! ListaTBC
            
            let params = ParametrosPesquisa()
            newView.params = params
        }
        
        if (segue.identifier == "detalheImovel"){
            let newView = segue.destinationViewController as! DetalheImovelVC
            
            let indexPath = self.listaDestaque.indexPathsForSelectedItems()?.first
            
            newView.imovel = imoveisDestaque[(indexPath?.row)!]
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.imoveisDestaque.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as UICollectionViewCell
        
        let imovel : Imovel = imoveisDestaque[indexPath.row]
        
        let titulo : UILabel = cell.viewWithTag(1) as! UILabel
        titulo.text = imovel.titulo
        
        let imagem : UIImageView = cell.viewWithTag(2) as! UIImageView
        WebService.carregaImagem(imagem,idImovel: imovel.id,nome: imovel.getFotoPrincipal().getNome(TipoFotoImovel.grande))
        imagem.layer.zPosition = -1
        
        
        let valor : UILabel = cell.viewWithTag(3) as! UILabel
        valor.text = "R$ \(imovel.valor)"
        
        return cell
    }
    
    
}