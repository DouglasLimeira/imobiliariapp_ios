//
//  MenuVC.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 10/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

class MenuVC: UITableViewController {
    
    @IBOutlet var menuView: UITableView!
    
    var itens = [String]()
    
    override func viewDidLoad() {
        itens = ["Titulo","Login","Início","Mapa","Lista de Imóveis","Anuncie Aqui"]
        
    }
    
    @IBAction func cadastroClick(sender: UIButton) {
    }
    @IBAction func loginClick(sender: UIButton) {
        itens[1] = "Bem Vindo"
        itens.append("Plantões")
        menuView.reloadData()
    }
    @IBAction func sairClick(sender: UIButton) {
        itens[1] = "Login"
        itens.removeLast()
        menuView.reloadData()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let item = tableView.dequeueReusableCellWithIdentifier(itens[indexPath.row], forIndexPath: indexPath) as UITableViewCell
        
        return item
    }
    
}