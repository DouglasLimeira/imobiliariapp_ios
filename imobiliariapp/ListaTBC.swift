//
//  ListaTBC.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 19/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation

class ListaTBC: UITabBarController {
    
    @IBOutlet weak var btMenu: UIBarButtonItem!
    
    var params = ParametrosPesquisa()
    
    override func viewDidLoad() {
        btMenu.target = self.revealViewController()
        btMenu.action = Selector("revealToggle:")
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .ScaleAspectFit
        
        let image = UIImage(named: "titulo")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
