//
//  PGInfoViewController.swift
//  PGFinder
//
//  Created by Apple on 03/09/23.
//

import Foundation
import UIKit


class customCellsforPGInfo : UICollectionViewCell{
    @IBOutlet weak var roomsPics: UIImageView!
}


class customCellsforPGInformation: UITableViewCell {
    @IBOutlet weak var pgAddress: UILabel!
    @IBOutlet weak var roomsPrice: UILabel!
}

class customCellsforFoodRoutine : UITableViewCell {
    
}

class customCellsforPGAmenities : UITableViewCell {
        
        @IBOutlet weak var roomType: UILabel!
        @IBOutlet weak var washingMachine: UILabel!
        @IBOutlet weak var geyser: UILabel!
        @IBOutlet weak var airConditioner: UILabel!
        @IBOutlet weak var wifi: UILabel!
    }
class PGInfoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pgDetailsArray: [PGDetails] = []
    var indexRow: IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
    }
}

extension PGInfoViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
        case 2:
            cellIdentifier = "cell3"
        default:
            cellIdentifier = "defaultCell" // Use an appropriate default cell identifier
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        switch indexPath.section {
        case 0:
            if let customCell = cell as? customCellsforPGInformation {
                // Configure the custom cell for section 0 if applicable
                // customCell.configure(...)
                let pgDetails = pgDetailsArray[indexRow.section]
                customCell.pgAddress.text = pgDetails.pgAddress
                customCell.roomsPrice.text = pgDetails.pgRent
            }
        case 1:
            if let customCell = cell as? customCellsforFoodRoutine {
                // Configure the custom cell for section 1 if applicable
                // customCell.configure(...)
            }
        case 2:
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

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as? customCellsforPGInfo {
            let pgDetails = pgDetailsArray[indexRow.section]
            cell.roomsPics.image = pgDetails.roomPics
            return cell
        } else {
            // Handle other collection views if needed
            // You can return a default cell or handle the error case here
            return UICollectionViewCell()
        }
    }
}


