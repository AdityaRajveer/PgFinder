//
//  PGFinderHomeViewController.swift
//  PGFinder
//
//  Created by Apple on 31/07/23.
//

import Foundation
import UIKit

class customCollCellsHomeScreen : UICollectionViewCell {
    @IBOutlet weak var roomPics: UIImageView!
    @IBOutlet weak var savePG: UIButton!
    @IBOutlet weak var shareButton: UIButton!
}
class customCellsHomeScreen : UITableViewCell {
    
    @IBOutlet weak var pgRent: UILabel!
    @IBOutlet weak var pgAddress: UILabel!
    @IBOutlet weak var listedDate: UILabel!
    @IBOutlet weak var pgServiceAvailability: UILabel!
    @IBOutlet weak var pgNames: UILabel!
}
    
class PGFinderHomeViewController :UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberOfPG: UILabel!

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var lblNoResultFound: UILabel!
    @IBOutlet weak var searchShowImageView: UIImageView!
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
        
        numberOfPG.text = "\(pgDetailsArray.count) PG's available"
        
        // Add the search bar to the topView
        topView.addSubview(searchBar)
    
    }
    
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
    
}
extension UITableView {
    func indexPathForCellSubview(_ subview: UIView) -> IndexPath? {
        let pointInTable = subview.convert(subview.bounds.origin, to: self)
        return self.indexPathForRow(at: pointInTable)
    }
}


extension PGFinderHomeViewController : UISearchBarDelegate, UISearchControllerDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearchActive = false
        filteredData = [] // Clear the filtered data
        tableView.reloadData()
        searchBar.showsCancelButton = false
        searchShowImageView.isHidden = true
        lblNoResultFound.isHidden = true
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData(with: searchText)
        searchBar.showsCancelButton = true // Show the cancel button
    }
    
    func filterData(with searchText: String) {
        if searchText.isEmpty {
            isSearchActive = false
            filteredData = []
            searchShowImageView.isHidden = true
            lblNoResultFound.isHidden = true
            numberOfPG.text = "\(pgDetailsArray.count) PG's available"
        } else {
            isSearchActive = true
            filteredData = pgDetailsArray.filter { pgDetails in
                let containsText = pgDetails.pgName.localizedCaseInsensitiveContains(searchText) ||
                                  pgDetails.pgAddress.localizedCaseInsensitiveContains(searchText)
                
                if containsText {
                    numberOfPG.text = "\(filteredData.count) PG's available"
                }
                return containsText
            }

            // Show the search image if no result is found
            searchShowImageView.isHidden = filteredData.count != 0
            lblNoResultFound.isHidden = filteredData.count != 0
        }
        tableView.reloadData()
    }


      func willDismissSearchController(_ searchController: UISearchController) {
          navigationItem.searchController = nil // Dismiss the search controller
      }

      func didDismissSearchController(_ searchController: UISearchController) {
          searchController.searchBar.resignFirstResponder() // Hide the keyboard
      }
}

extension PGFinderHomeViewController : UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return isSearchActive ? filteredData.count : pgDetailsArray.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let checkPGInfo = storyboard?.instantiateViewController(withIdentifier: "PGInfoViewController") as? PGInfoViewController {
            checkPGInfo.pgDetailsArray = self.pgDetailsArray
            checkPGInfo.indexRow = indexPath
            tableView.deselectRow(at: indexPath, animated: true)
            self.present(checkPGInfo, animated: true, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? customCellsHomeScreen
        let pgDetails = isSearchActive ? filteredData[indexPath.section] : pgDetailsArray[indexPath.section]
        // Configure the cell using pgDetails
        cell?.pgNames.text = pgDetails.pgName
        cell?.pgAddress.text = pgDetails.pgAddress
        cell?.pgRent.text = pgDetails.pgRent
        cell?.pgServiceAvailability.text = pgDetails.pgAvailabilty
        cell?.listedDate.text = pgDetails.listedDate
        return cell ?? UITableViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collcell", for: indexPath) as? customCollCellsHomeScreen
        let pgDetails = pgDetailsArray[indexPath.row]
        cell?.roomPics.image = pgDetails.roomPics
        return cell!
    }
    
}
