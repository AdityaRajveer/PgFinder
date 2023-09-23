//
//  ViewController.swift
//  PGFinder
//
//  Created by Apple on 29/07/23.
//
import Foundation
import UIKit

class PGFinderViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        welcomeLabel.text = "Welcome to PGFinder"
    }
    @IBAction func lookingForPG(_ sender: Any) {
        if let selectLocationVC = storyboard?.instantiateViewController(withIdentifier: "SelectLocationViewController") as? SelectLocationViewController {
                   navigationController?.pushViewController(selectLocationVC, animated: true)
               }
    }
    
    @IBAction func PGOwner(_ sender: Any) {
        if let pgOwnerVC = storyboard?.instantiateViewController(withIdentifier: "PGOwnerViewController") as? PGOwnerViewController {
                   navigationController?.pushViewController(pgOwnerVC, animated: true)
               }
    }

}

