//
//  PGInfoTableViewCOntroller.swift
//  PGFinder
//
//  Created by Aditya Raj on 29/04/24.
//

import Foundation
import UIKit

extension PGInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier: String
        switch indexPath.section {
        case 0:
            cellIdentifier = "cell1"
        case 1:
            cellIdentifier = "cell2"
        default:
            cellIdentifier = "defaultCell" // Use an appropriate default cell identifier
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        switch indexPath.section {
        case 0:
            if let customCell = cell as? customCellsforPGInformation {
                let pgDetails = pgDetailsArray[indexRow.section]
                customCell.roomsPics.image = pgDetails.roomPics
                customCell.pgAddress.text = pgDetails.pgAddress
                customCell.roomsPrice.text = pgDetails.pgRent
            }
        case 1:
            if let customCell = cell as? customCellsforPGAmenities {
                customCell.roomType.text = "3 sharing"
                customCell.washingMachine.text = "Available"
                customCell.geyser.text = "Available"
                customCell.airConditioner.text = "Not Available"
                customCell.wifi.text = "Available"
            }
        default:
            break
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
