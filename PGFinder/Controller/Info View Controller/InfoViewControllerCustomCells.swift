//
//  InfoViewControllerCustomCells.swift
//  PGFinder
//
//  Created by Aditya Raj on 29/04/24.
//

import Foundation
import UIKit

class customCellsforPGInformation: UITableViewCell {
@IBOutlet weak var pgAddress: UILabel!
@IBOutlet weak var roomsPrice: UILabel!
@IBOutlet weak var roomsPics: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
}

class customCellsforPGAmenities : UITableViewCell {

@IBOutlet weak var roomType: UILabel!
@IBOutlet weak var washingMachine: UILabel!
@IBOutlet weak var geyser: UILabel!
@IBOutlet weak var airConditioner: UILabel!
@IBOutlet weak var wifi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

