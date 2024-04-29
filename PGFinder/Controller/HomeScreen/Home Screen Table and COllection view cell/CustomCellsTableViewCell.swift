//
//  CustomCellsTableViewCell.swift
//  PGFinder
//
//  Created by Aditya Raj on 26/04/24.
//

import UIKit

class CustomCellsTableViewCell : UITableViewCell {
    @IBOutlet weak var pgRent: UILabel!
    @IBOutlet weak var pgAddress: UILabel!
    @IBOutlet weak var listedDate: UILabel!
    @IBOutlet weak var pgServiceAvailability: UILabel!
    @IBOutlet weak var pgNames: UILabel!
    @IBOutlet weak var sliderCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
