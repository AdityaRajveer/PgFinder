//
//  HomeScreenSearchViewController.swift
//  PGFinder
//
//  Created by Aditya Raj on 30/04/24.
//

import UIKit

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
