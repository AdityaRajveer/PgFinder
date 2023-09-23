//
//  SelectCountryViewController.swift
//  PGFinder
//
//  Created by Apple on 07/08/23.
//

import Foundation
import UIKit
import MapKit

class SelectPlaceViewController : UIViewController {
    
    let mapView = MKMapView()
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        view.addSubview(mapView)
        
       // let panel = FloatingPanelController()
        titleUISetup()
        }
    
    func titleUISetup() {
        if let navigationController = navigationController {
            // Set the navigation bar title
            self.title = "PGFinder"
            
            // Customize the title font and color
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white, // Change to your desired text color
                .font: UIFont(name: "Helvetica-Bold", size: 25) ?? UIFont.boldSystemFont(ofSize: 25) // Change to your desired font and size
            ]
            navigationController.navigationBar.titleTextAttributes = attributes
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
   
}
