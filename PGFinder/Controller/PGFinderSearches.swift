//
//  File.swift
//  PGFinder
//
//  Created by Apple on 07/08/23.
//

import Foundation
import UIKit

class PGFinderSearches : UIViewController {
    
    @IBOutlet weak var listSwitchBtn: UISegmentedControl!
    @IBOutlet weak var searchHistory: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        showViewController(atIndex:1)
    }
    
    func showViewController(atIndex index: Int) {
        if index == 0 {
            tableView.isHidden = false
            searchHistory.isHidden = true
             } else {
                 tableView.isHidden = true
                 searchHistory.isHidden = false
             }
    }

    @IBAction func listSwitchBtnTapped(_ sender: Any) {
        showViewController(atIndex: listSwitchBtn.selectedSegmentIndex)
    }
}

extension PGFinderSearches  : UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchTBCell")
        return cell ?? UITableViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "srchCollcell", for: indexPath)
        
        return cell
    }
}

