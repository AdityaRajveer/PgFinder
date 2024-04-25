//
//  SelectLocationViewController.swift
//  PGFinder
//
//  Created by Apple on 07/08/23.
//

import Foundation
import UIKit

class SelectLocationViewController : UIViewController  {
    
    @IBOutlet weak var whichPlaceLabel: UILabel!
    @IBOutlet weak var searchImg: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        whichPlaceLabel.text = "Which place?"
        searchImg.isHidden = false
        searchImg.isHidden = false
        placeNameLabel.isHidden = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        searchView.addGestureRecognizer(tapGesture)
        searchView.isUserInteractionEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        searchView.layer.cornerRadius = searchView.frame.height / 2
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        if let findPlace = UIStoryboard(name: "SelectLocationViewController", bundle: nil).instantiateViewController(withIdentifier: "SelectPlaceViewController") as? SelectPlaceViewController {
            navigationController?.pushViewController(findPlace, animated: true)
        }
    }

  //MARK: Button Actions
    @IBAction func goToSetPriceViewController(_ sender: Any) {
        if let selectPrice = UIStoryboard(name: "SelectPriceViewController", bundle: nil).instantiateViewController(withIdentifier: "SelectPriceViewController") as? SelectPriceViewController {
            navigationController?.pushViewController(selectPrice, animated: true)
        }
    }
}
