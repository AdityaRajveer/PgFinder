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
