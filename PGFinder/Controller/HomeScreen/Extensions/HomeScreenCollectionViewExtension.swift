//
//  HomeScreenTableViewExtension.swift
//  PGFinder
//
//  Created by Aditya Raj on 30/04/24.
//

import UIKit

extension PGFinderHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collcell", for: indexPath) as? CustomHomeScreenCollectionViewCell
        let pgDetails = pgDetailsArray[indexPath.row]
//        cell?.roomPics.image = pgDetails.roomPics
        cell?.roomPics.image = UIImage(named: "rooms")

        cell?.savePG.layer.backgroundColor = UIColor.black.withAlphaComponent(0.5).cgColor
        // Make the savePG view a circle
        cell?.savePG.layer.cornerRadius = (cell?.savePG.bounds.width ?? 0) / 2.0
        cell?.savePG.layer.masksToBounds = true
        cell?.shareButton.layer.backgroundColor = UIColor.black.withAlphaComponent(0.5).cgColor
        // Make the shareButton view a circle
        cell?.shareButton.layer.cornerRadius = (cell?.shareButton.bounds.width ?? 0) / 2.0
        cell?.shareButton.layer.masksToBounds = true
        cell?.pageControl.currentPage = indexPath.row
        return cell!
    }

}

