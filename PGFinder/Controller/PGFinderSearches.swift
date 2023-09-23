//
//  File.swift
//  PGFinder
//
//  Created by Apple on 07/08/23.
//

import Foundation
import UIKit

class PGFinderSearches :UIViewController {
    
    @IBOutlet weak var listSwitchBtn: UISegmentedControl!
    var firstViewController : SavedPGViewController!
    var secondViewController : SearchHistoryViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewControllers()
        showViewController(atIndex:1)
    }
    
    func setupViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        firstViewController = storyboard.instantiateViewController(withIdentifier: "SavedPGViewController") as? SavedPGViewController
        secondViewController = storyboard.instantiateViewController(withIdentifier: "SearchHistoryViewController") as? SearchHistoryViewController
    }
    
    func showViewController(atIndex index: Int) {
        if index == 0 {
                 addChild(firstViewController)
                 secondViewController.removeFromParent()
                 view.addSubview(firstViewController.view)
             } else {
                 addChild(secondViewController)
                 firstViewController.removeFromParent()
                 view.addSubview(secondViewController.view)
             }
    }

    @IBAction func listSwitchBtnTapped(_ sender: Any) {
        showViewController(atIndex: listSwitchBtn.selectedSegmentIndex)
    }
}
