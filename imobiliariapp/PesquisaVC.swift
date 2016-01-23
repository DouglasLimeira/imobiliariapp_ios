//
//  PesquisaVC.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 21/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation
import Alamofire

class PesquisaVC : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var listaTipos = [String]()
    @IBOutlet weak var tipo: UIButton!
    @IBOutlet weak var comboTipos: UICollectionView!
    
    var listaBairros = [String]()
    @IBOutlet weak var bairro: UIButton!
    @IBOutlet weak var comboBairros: UICollectionView!
    
    let listaValores = ["Qualquer","R$ 50.000","R$ 75.000","R$ 100.000","R$ 150.000","R$ 200.000","R$ 250.000","R$ 300.000","R$ 400.000","R$ 500.000","R$ 600.000","R$ 700.000","R$ 800.000","R$ 900.000","R$ 1.000.000","R$ 1.200.000","R$ 1.400.000","R$ 1.600.000","R$ 2.000.000","R$ 3.000.000","R$ 3.500.000","R$ 4.000.000","R$ 4.500.000","R$ 5.000.000"]
    @IBOutlet weak var valorMinimo: UIButton!
    @IBOutlet weak var comboValorMinimo: UICollectionView!
    @IBOutlet weak var valorMaximo: UIButton!
    @IBOutlet weak var comboValorMaximo: UICollectionView!
    
    @IBOutlet weak var quarto0: UIButton!
    @IBOutlet weak var quarto1: UIButton!
    @IBOutlet weak var quarto2: UIButton!
    @IBOutlet weak var quarto3: UIButton!
    @IBOutlet weak var quarto4: UIButton!
    @IBOutlet weak var quarto5: UIButton!
    
    @IBOutlet weak var garagens0: UIButton!
    @IBOutlet weak var garagens1: UIButton!
    @IBOutlet weak var garagens2: UIButton!
    @IBOutlet weak var garagens3: UIButton!
    @IBOutlet weak var garagens4: UIButton!
    @IBOutlet weak var garagens5: UIButton!
    
    @IBOutlet weak var area0: UIButton!
    @IBOutlet weak var area30: UIButton!
    @IBOutlet weak var area60: UIButton!
    @IBOutlet weak var area100: UIButton!
    @IBOutlet weak var area200: UIButton!
    @IBOutlet weak var area350: UIButton!
    
    let selecionadoCor = UIColor(red: 255/255.0, green: 200/255.0, blue: 40/255.0, alpha: 0.4)
    let naoSelecionadoCor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
    
    var tipoSelecao = "Todos"
    var bairroSelecao = "Todos"
    var valorMinimoSelecao = "Qualquer"
    var valorMaximoSelecao = "Qualquer"
    var quartoSelecao = "0"
    var garagemSelecao = "0"
    var areaSelecao = "0"
    
    override func viewDidLoad() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .ScaleAspectFit
        
        let image = UIImage(named: "titulo")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        ajustesLayout()
        carregaListas()
    }
    
    func carregaListas(){
        listaTipos = TipoImovel.allData()
        listaTipos.insert("Todos", atIndex: 0)
        self.comboTipos.reloadData()
        
        Alamofire.request(.GET, "http://localhost:8080/imoveis/service/imoveis/getListaBairros").responseJSON{ response in
            if let json = response.result.value{
                self.listaBairros = [String]()
                self.listaBairros.append("Todos")
                
                for bairro in (json as! NSArray){
                    self.listaBairros.append(bairro as! String)
                }
                
                self.comboBairros.reloadData()
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "aplicarPesquisa"){
            var params = ParametrosPesquisa()
            
            params.tipoImovel = tipoSelecao
            params.bairro = bairroSelecao
            params.quartoMenor = quartoSelecao
            params.garagemMenor = garagemSelecao
            params.areaMenor = areaSelecao
            
            if valorMinimoSelecao == "Qualquer"{
                params.valorMenor = "0"
            } else{
                params.valorMenor = valorMinimoSelecao
            }
            
            if valorMaximoSelecao == "Qualquer"{
                params.valorMaior = "999999999"
            } else{
                params.valorMaior = valorMaximoSelecao
            }
            
            let navigationController = segue.destinationViewController as! UINavigationController
            let newView = navigationController.viewControllers.first as! ListaTBC
            newView.params = params
        }
    }
    
    @IBAction func limpaPesquisa(sender: AnyObject) {
        tipoSelecao = "Todos"
        bairroSelecao = "Todos"
        valorMinimoSelecao = "Qualquer"
        valorMaximoSelecao = "Qualquer"
        quartoSelecao = "0"
        garagemSelecao = "0"
        areaSelecao = "0"
        
        tipo.setTitle("Todos", forState: .Normal)
        bairro.setTitle("Todos", forState: .Normal)
        valorMinimo.setTitle("Qualquer", forState: .Normal)
        valorMaximo.setTitle("Qualquer", forState: .Normal)
        
        quarto0.backgroundColor = selecionadoCor
        quarto1.backgroundColor = naoSelecionadoCor
        quarto2.backgroundColor = naoSelecionadoCor
        quarto3.backgroundColor = naoSelecionadoCor
        quarto4.backgroundColor = naoSelecionadoCor
        quarto5.backgroundColor = naoSelecionadoCor
        
        garagens0.backgroundColor = selecionadoCor
        garagens1.backgroundColor = naoSelecionadoCor
        garagens2.backgroundColor = naoSelecionadoCor
        garagens3.backgroundColor = naoSelecionadoCor
        garagens4.backgroundColor = naoSelecionadoCor
        garagens5.backgroundColor = naoSelecionadoCor
        
        area0.backgroundColor = selecionadoCor
        area30.backgroundColor = naoSelecionadoCor
        area60.backgroundColor = naoSelecionadoCor
        area100.backgroundColor = naoSelecionadoCor
        area200.backgroundColor = naoSelecionadoCor
        area350.backgroundColor = naoSelecionadoCor
        
        comboTipos.hidden = true
        comboBairros.hidden = true
        comboValorMinimo.hidden = true
        comboValorMaximo.hidden = true
    }
    
    func ajustesLayout(){
        let bordaCor = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
        
        Util.putBorda(tipo,cor: bordaCor,tamanho: 1)
        Util.putBorda(bairro,cor: bordaCor,tamanho: 1)
        Util.putBorda(valorMinimo,cor: bordaCor,tamanho: 1)
        Util.putBorda(valorMaximo,cor: bordaCor,tamanho: 1)
        
        Util.putBorda(quarto0,cor: bordaCor,tamanho: 1)
        Util.putBorda(quarto1,cor: bordaCor,tamanho: 1)
        Util.putBorda(quarto2,cor: bordaCor,tamanho: 1)
        Util.putBorda(quarto3,cor: bordaCor,tamanho: 1)
        Util.putBorda(quarto4,cor: bordaCor,tamanho: 1)
        Util.putBorda(quarto5,cor: bordaCor,tamanho: 1)
        
        Util.putBorda(garagens0,cor: bordaCor,tamanho: 1)
        Util.putBorda(garagens1,cor: bordaCor,tamanho: 1)
        Util.putBorda(garagens2,cor: bordaCor,tamanho: 1)
        Util.putBorda(garagens3,cor: bordaCor,tamanho: 1)
        Util.putBorda(garagens4,cor: bordaCor,tamanho: 1)
        Util.putBorda(garagens5,cor: bordaCor,tamanho: 1)
        
        Util.putBorda(area0,cor: bordaCor,tamanho: 1)
        Util.putBorda(area30,cor: bordaCor,tamanho: 1)
        Util.putBorda(area60,cor: bordaCor,tamanho: 1)
        Util.putBorda(area100,cor: bordaCor,tamanho: 1)
        Util.putBorda(area200,cor: bordaCor,tamanho: 1)
        Util.putBorda(area350,cor: bordaCor,tamanho: 1)
        
        Util.putBorda(comboTipos, cor: bordaCor,tamanho: 1)
        Util.putBorda(comboBairros, cor: bordaCor,tamanho: 1)
        Util.putBorda(comboValorMinimo, cor: bordaCor,tamanho: 1)
        Util.putBorda(comboValorMaximo, cor: bordaCor,tamanho: 1)
        
        quarto0.backgroundColor = selecionadoCor
        garagens0.backgroundColor = selecionadoCor
        area0.backgroundColor = selecionadoCor
    }
    
    @IBAction func clickView(sender: AnyObject) {
        comboTipos.hidden = true
        comboBairros.hidden = true
        comboValorMinimo.hidden = true
        comboValorMaximo.hidden = true
    }
    
    @IBAction func clickComboTipo(sender: UIButton) {
        comboTipos.hidden = !comboTipos.hidden
        
        comboBairros.hidden = true
        comboValorMinimo.hidden = true
        comboValorMaximo.hidden = true
    }
    
    @IBAction func clickTipoSelected(sender: UIButton) {
        tipo.setTitle(sender.titleLabel?.text, forState: .Normal)
        comboTipos.hidden = true
        
        tipoSelecao = (sender.titleLabel?.text)!
    }
    
    @IBAction func clickComboBairro(sender: UIButton) {
        comboBairros.hidden = !comboBairros.hidden
        
        comboTipos.hidden = true
        comboValorMinimo.hidden = true
        comboValorMaximo.hidden = true
    }
    
    @IBAction func clickBairroSelected(sender: UIButton) {
        bairro.setTitle(sender.titleLabel?.text, forState: .Normal)
        comboBairros.hidden = true
        
        bairroSelecao = (sender.titleLabel?.text)!
    }
    
    @IBAction func clickComboValorMinimo(sender: UIButton) {
        comboValorMinimo.hidden = !comboValorMinimo.hidden
        
        comboTipos.hidden = true
        comboBairros.hidden = true
        comboValorMaximo.hidden = true
    }
    
    @IBAction func clickValorMinimoSelected(sender: UIButton) {
        valorMinimo.setTitle(sender.titleLabel?.text, forState: .Normal)
        comboValorMinimo.hidden = true
        
        valorMinimoSelecao = (sender.titleLabel?.text)!
    }
    
    @IBAction func clickComboValorMaximo(sender: UIButton) {
        comboValorMaximo.hidden = !comboValorMaximo.hidden
        
        comboTipos.hidden = true
        comboBairros.hidden = true
        comboValorMinimo.hidden = true
    }
    
    @IBAction func clickValorMaximoSelected(sender: UIButton) {
        valorMaximo.setTitle(sender.titleLabel?.text, forState: .Normal)
        comboValorMaximo.hidden = true
        
        valorMaximoSelecao = (sender.titleLabel?.text)!
    }
    
    @IBAction func clickQuarto(sender: UIButton) {
        if (sender.titleLabel?.text == "0+"){
            quarto0.backgroundColor = selecionadoCor
            quarto1.backgroundColor = naoSelecionadoCor
            quarto2.backgroundColor = naoSelecionadoCor
            quarto3.backgroundColor = naoSelecionadoCor
            quarto4.backgroundColor = naoSelecionadoCor
            quarto5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "1+"){
            quarto0.backgroundColor = naoSelecionadoCor
            quarto1.backgroundColor = selecionadoCor
            quarto2.backgroundColor = naoSelecionadoCor
            quarto3.backgroundColor = naoSelecionadoCor
            quarto4.backgroundColor = naoSelecionadoCor
            quarto5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "2+"){
            quarto0.backgroundColor = naoSelecionadoCor
            quarto1.backgroundColor = naoSelecionadoCor
            quarto2.backgroundColor = selecionadoCor
            quarto3.backgroundColor = naoSelecionadoCor
            quarto4.backgroundColor = naoSelecionadoCor
            quarto5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "3+"){
            quarto0.backgroundColor = naoSelecionadoCor
            quarto1.backgroundColor = naoSelecionadoCor
            quarto2.backgroundColor = naoSelecionadoCor
            quarto3.backgroundColor = selecionadoCor
            quarto4.backgroundColor = naoSelecionadoCor
            quarto5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "4+"){
            quarto0.backgroundColor = naoSelecionadoCor
            quarto1.backgroundColor = naoSelecionadoCor
            quarto2.backgroundColor = naoSelecionadoCor
            quarto3.backgroundColor = naoSelecionadoCor
            quarto4.backgroundColor = selecionadoCor
            quarto5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "5+"){
            quarto0.backgroundColor = naoSelecionadoCor
            quarto1.backgroundColor = naoSelecionadoCor
            quarto2.backgroundColor = naoSelecionadoCor
            quarto3.backgroundColor = naoSelecionadoCor
            quarto4.backgroundColor = naoSelecionadoCor
            quarto5.backgroundColor = selecionadoCor
        }
        
        quartoSelecao = (sender.titleLabel?.text?[0])!
        
        comboTipos.hidden = true
        comboBairros.hidden = true
        comboValorMinimo.hidden = true
        comboValorMaximo.hidden = true
    }
    
    @IBAction func clickGaragem(sender: UIButton) {
        if (sender.titleLabel?.text == "0+"){
            garagens0.backgroundColor = selecionadoCor
            garagens1.backgroundColor = naoSelecionadoCor
            garagens2.backgroundColor = naoSelecionadoCor
            garagens3.backgroundColor = naoSelecionadoCor
            garagens4.backgroundColor = naoSelecionadoCor
            garagens5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "1+"){
            garagens0.backgroundColor = naoSelecionadoCor
            garagens1.backgroundColor = selecionadoCor
            garagens2.backgroundColor = naoSelecionadoCor
            garagens3.backgroundColor = naoSelecionadoCor
            garagens4.backgroundColor = naoSelecionadoCor
            garagens5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "2+"){
            garagens0.backgroundColor = naoSelecionadoCor
            garagens1.backgroundColor = naoSelecionadoCor
            garagens2.backgroundColor = selecionadoCor
            garagens3.backgroundColor = naoSelecionadoCor
            garagens4.backgroundColor = naoSelecionadoCor
            garagens5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "3+"){
            garagens0.backgroundColor = naoSelecionadoCor
            garagens1.backgroundColor = naoSelecionadoCor
            garagens2.backgroundColor = naoSelecionadoCor
            garagens3.backgroundColor = selecionadoCor
            garagens4.backgroundColor = naoSelecionadoCor
            garagens5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "4+"){
            garagens0.backgroundColor = naoSelecionadoCor
            garagens1.backgroundColor = naoSelecionadoCor
            garagens2.backgroundColor = naoSelecionadoCor
            garagens3.backgroundColor = naoSelecionadoCor
            garagens4.backgroundColor = selecionadoCor
            garagens5.backgroundColor = naoSelecionadoCor
        }
        if (sender.titleLabel?.text == "5+"){
            garagens0.backgroundColor = naoSelecionadoCor
            garagens1.backgroundColor = naoSelecionadoCor
            garagens2.backgroundColor = naoSelecionadoCor
            garagens3.backgroundColor = naoSelecionadoCor
            garagens4.backgroundColor = naoSelecionadoCor
            garagens5.backgroundColor = selecionadoCor
        }
        
        garagemSelecao = (sender.titleLabel?.text?[0])!
        
        comboTipos.hidden = true
        comboBairros.hidden = true
        comboValorMinimo.hidden = true
        comboValorMaximo.hidden = true
    }
    
    @IBAction func clickArea(sender: UIButton) {
        if (sender.titleLabel?.text == "0+"){
            area0.backgroundColor = selecionadoCor
            area30.backgroundColor = naoSelecionadoCor
            area60.backgroundColor = naoSelecionadoCor
            area100.backgroundColor = naoSelecionadoCor
            area200.backgroundColor = naoSelecionadoCor
            area350.backgroundColor = naoSelecionadoCor
            
            areaSelecao = "0"
        }
        if (sender.titleLabel?.text == "30+"){
            area0.backgroundColor = naoSelecionadoCor
            area30.backgroundColor = selecionadoCor
            area60.backgroundColor = naoSelecionadoCor
            area100.backgroundColor = naoSelecionadoCor
            area200.backgroundColor = naoSelecionadoCor
            area350.backgroundColor = naoSelecionadoCor
            
            areaSelecao = "30"
        }
        if (sender.titleLabel?.text == "60+"){
            area0.backgroundColor = naoSelecionadoCor
            area30.backgroundColor = naoSelecionadoCor
            area60.backgroundColor = selecionadoCor
            area100.backgroundColor = naoSelecionadoCor
            area200.backgroundColor = naoSelecionadoCor
            area350.backgroundColor = naoSelecionadoCor
            
            areaSelecao = "60"
        }
        if (sender.titleLabel?.text == "100+"){
            area0.backgroundColor = naoSelecionadoCor
            area30.backgroundColor = naoSelecionadoCor
            area60.backgroundColor = naoSelecionadoCor
            area100.backgroundColor = selecionadoCor
            area200.backgroundColor = naoSelecionadoCor
            area350.backgroundColor = naoSelecionadoCor
            
            areaSelecao = "100"
        }
        if (sender.titleLabel?.text == "200+"){
            area0.backgroundColor = naoSelecionadoCor
            area30.backgroundColor = naoSelecionadoCor
            area60.backgroundColor = naoSelecionadoCor
            area100.backgroundColor = naoSelecionadoCor
            area200.backgroundColor = selecionadoCor
            area350.backgroundColor = naoSelecionadoCor
            
            areaSelecao = "200"
        }
        if (sender.titleLabel?.text == "350+"){
            area0.backgroundColor = naoSelecionadoCor
            area30.backgroundColor = naoSelecionadoCor
            area60.backgroundColor = naoSelecionadoCor
            area100.backgroundColor = naoSelecionadoCor
            area200.backgroundColor = naoSelecionadoCor
            area350.backgroundColor = selecionadoCor
            
            areaSelecao = "350"
        }
        
        comboTipos.hidden = true
        comboBairros.hidden = true
        comboValorMinimo.hidden = true
        comboValorMaximo.hidden = true
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag{
            case 1: return listaTipos.count
            case 2: return listaBairros.count
            case 3: return listaValores.count
            case 4: return listaValores.count
            default: return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("celula", forIndexPath: indexPath)
        
        var titulo = ""
        
        switch collectionView.tag{
            case 1: titulo = listaTipos[indexPath.row]
            case 2: titulo = listaBairros[indexPath.row]
            case 3: titulo = listaValores[indexPath.row]
            case 4: titulo = listaValores[indexPath.row]
            default: titulo = ""
        }

        let item = cell.viewWithTag(1) as! UIButton
        item.setTitle(titulo, forState: .Normal)
        
        return cell
    }
}

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
}