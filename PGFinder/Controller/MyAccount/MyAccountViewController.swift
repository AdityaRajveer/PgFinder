//
//  MyAccountViewController.swift
//  PGFinder
//
//  Created by Apple on 14/08/23.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var listSelected: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
}
class MyAccountViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sections: [[(name: String, listSelected: String?, contentImage: UIImage?)]] = [
        [], // Section 0: Placeholder
        [
            ("Language", "English", UIImage(named: "img1"))
        ],
        [
            ("Language", "English", UIImage(named: "languageColor")),
            ("Place", "Bengaluru", UIImage(named: "globeColor")),
            ("Occupation", "Job", UIImage(named: "suitcaseColor")),
        ],
        [
            ("About", nil, UIImage(named: "infoColor")),
            ("Rate us", nil, UIImage(named: "rateusColor"))
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func loginBtnTapped(_ sender: Any) {
        if let pgOwnerVC = storyboard?.instantiateViewController(withIdentifier: "PGOwnerViewController") as? PGOwnerViewController {
                   present(pgOwnerVC, animated: true)
               }
    }
    
}

extension MyAccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if let pgOwnerVC = storyboard?.instantiateViewController(withIdentifier: "PGOwnerViewController") as? PGOwnerViewController {
                       present(pgOwnerVC, animated: true)
                   }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CustomCell
            let sectionData = sections[indexPath.section][indexPath.row]
            
            cell.nameLabel.text = sectionData.name
            cell.listSelected.text = sectionData.listSelected
            cell.contentImage.image = sectionData.contentImage
            
            return cell
        }
    }
}
