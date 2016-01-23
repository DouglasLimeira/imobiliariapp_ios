//
//  MapaVC.swift
//  imobiliariapp
//
//  Created by Felipe Dantas on 12/11/15.
//  Copyright © 2015 Felipe Dantas. All rights reserved.
//

import Foundation
import MapKit

class MapaVC: UIViewController {
    
    @IBOutlet weak var btMenu: UIBarButtonItem!
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewDidLoad() {
        btMenu.target = self.revealViewController()
        btMenu.action = Selector("revealToggle:")
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .ScaleAspectFit
        
        let image = UIImage(named: "titulo")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        mapa.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)
    }
}