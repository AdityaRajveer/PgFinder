//
//  HomeScreenTableViewExtension.swift
//  PGFinder
//
//  Created by Aditya Raj on 30/04/24.
//

import UIKit

extension PGFinderHomeViewController : UITableViewDelegate, UITableViewDataSource {

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCellsTableViewCell
        let pgDetails = isSearchActive ? filteredData[indexPath.section] : pgDetailsArray[indexPath.section]
        // Configure the cell using pgDetails
        cell?.pgNames.text = pgDetails.pgName
        cell?.pgAddress.text = pgDetails.pgAddress
        cell?.pgRent.text = pgDetails.pgRent
        cell?.pgServiceAvailability.text = pgDetails.pgAvailabilty
        cell?.listedDate.text = pgDetails.listedDate
        return cell ?? UITableViewCell()
    }
}
