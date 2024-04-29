//
//  CustomHomeScreenCollectionViewCell.swift
//  PGFinder
//
//  Created by Aditya Raj on 26/04/24.
//

import UIKit

class CustomHomeScreenCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var roomPics: UIImageView!
    @IBOutlet weak var savePG: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    var currentPageCount = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
    }
}
