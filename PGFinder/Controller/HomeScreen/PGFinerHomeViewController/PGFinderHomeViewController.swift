//
//  PGFinderHomeViewController.swift
//  PGFinder
//
//  Created by Apple on 31/07/23.
//

import Foundation
import UIKit
    
class PGFinderHomeViewController :UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberOfPG: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var lblNoResultFound: UILabel!
    @IBOutlet weak var searchShowImageView: UIImageView!
    @IBOutlet weak var mapKitView: UIImageView!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var sortBtn: UIButton!

    
    var pgDetailsArray: [PGDetails] = []
    var isSearchActive: Bool = false
    var filteredData: [PGDetails] = []
    let searchText = ""

    
    // Create a search bar
     let searchBar: UISearchBar = {
         let searchBar = UISearchBar()
         searchBar.placeholder = "Search PGs"
         searchBar.translatesAutoresizingMaskIntoConstraints = false
         return searchBar
     }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        // Set the delegate for the search bar
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchShowImageView.isHidden = true
        lblNoResultFound.isHidden = true
        
        let pgInfo: [(name: String, address: String?, rent: String?, pgAvailabilty: String?,listedDate: String?, rooms: UIImage?)] =
        [
            ("Samara Gents PG", "BTM 1st Stage","Rs. 6500/month","3 Sharing  Non-AC   Washing Machine   WIFI    Aquaguard","Listed 3 months ago", UIImage(named: "rooms1")),
            ("Srinivasa Mens PG", "BTM 2nd Stage","Rs. 7500/month","2 Sharing  Non-AC   Washing Machine   WIFI    Aquaguard","Listed 5 days ago", UIImage(named: "rooms2")),
            ("Ashoka Luxury Mens PG", "HSR Layout","Rs. 9500/month","3 Sharing  AC   Washing Machine   WIFI    Aquaguard","Listed 6 months ago", UIImage(named: "rooms2")),
            ("Colive PG", "BTM 2nd Stage","Rs. 8500/month","3 Sharing  AC   Washing Machine   WIFI    Aquaguard","Listed 2 months ago", UIImage(named: "rooms")),
            ("Venkaya Mens PG", "HSR BDA Complex","Rs. 7500/month","2 Sharing  Non-AC   Washing Machine   WIFI    Aquaguard","Listed 4 months ago", UIImage(named: "rooms1")),
            ("Aditya Luxury Mens PG", "HSR Layout","Rs. 9500/month","3 Sharing  AC   Washing Machine   WIFI    Aquaguard","Listed 1 months ago", UIImage(named: "rooms2")),
            ("Mukundaya Gents PG", "BTM 1st Stage","Rs. 6500/month","3 Sharing  Non-AC   Washing Machine   WIFI    Aquaguard","Listed 8 months ago", UIImage(named: "rooms")),
            ("Srinivasa Mens PG", "BTM 2nd Stage","Rs. 7500/month","2 Sharing  Non-AC   Washing Machine   WIFI    Aquaguard","Listed 15 days ago", UIImage(named: "rooms1")),
            ("Ashoka Luxury Mens PG", "HSR Layout","Rs. 9500/month","3 Sharing  AC   Washing Machine   WIFI    Aquaguard","Listed 10 months ago", UIImage(named: "rooms")),
            ("Sujit Mens PG", "HSR Layout","Rs. 9500/month","3 Sharing  AC   Washing Machine   WIFI    Aquaguard","Listed 1 months ago", UIImage(named: "rooms1")),
        ]
        
        for pgInfoItem in pgInfo {
            let pgDetails = PGDetails(pgName: pgInfoItem.name,
                                      pgAddress: pgInfoItem.address ?? "",
                                      pgRent: pgInfoItem.rent ?? "",
                                      pgAvailabilty: pgInfoItem.pgAvailabilty ?? "",
                                      listedDate: pgInfoItem.listedDate ?? "",
                                      roomPics: pgInfoItem.rooms!)
            pgDetailsArray.append(pgDetails)
        }
        saveBtn.layer.borderWidth = 1
        saveBtn.layer.borderColor = UIColor.blue.cgColor
        saveBtn.layer.cornerRadius = 10
        sortBtn.layer.borderWidth = 1
        sortBtn.layer.borderColor = UIColor.blue.cgColor
        sortBtn.layer.cornerRadius = 10
        
        numberOfPG.text = "\(pgDetailsArray.count) PG's available"
        
        // Add the search bar to the topView
        topView.addSubview(searchBar)
        //for temprary purpose
        mapKitView.isHidden = true
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mapKitView.addGestureRecognizer(tapGesture)
        mapKitView.isUserInteractionEnabled = true
    
    }
    
    //MARK: Button Action
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let newImage = UIImage(named: "heart.fill")?.withTintColor(.red)
        (sender as AnyObject).setImage(newImage, for: .selected)
           
           // You can use the sender's tag to identify the corresponding row and update your data model
        guard let rowIndex = (sender as AnyObject).tag else { return  }
           // Update your data model here
           
           // Reload the corresponding row to reflect the changes
        if let indexPath = tableView.indexPathForCellSubview(sender as! UIView) {
               pgDetailsArray[indexPath.section].isFavorite.toggle()
               tableView.reloadSections(IndexSet(integer: indexPath.section), with: .none)
           }
    }
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        if let findPlace = storyboard?.instantiateViewController(withIdentifier: "SelectPlaceViewController") as? SelectPlaceViewController {
            self.navigationController?.pushViewController(findPlace, animated: true)
        }
    }
    
}
extension UITableView {
    func indexPathForCellSubview(_ subview: UIView) -> IndexPath? {
        let pointInTable = subview.convert(subview.bounds.origin, to: self)
        return self.indexPathForRow(at: pointInTable)
    }
}
