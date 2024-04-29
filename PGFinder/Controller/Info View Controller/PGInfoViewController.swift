//
//  PGInfoViewController.swift
//  PGFinder
//
//  Created by Apple on 03/09/23.
//

import Foundation
import UIKit

class PGInfoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!  
    @IBOutlet weak var paymentTransferBtn: UIButton!
    
    var pgDetailsArray: [PGDetails] = []
    var indexRow: IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: Button Action
    @IBAction func paymentTransferBtnAction(_ sender: Any) {
        let tesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentTransferViewController") as! PaymentTransferViewController
        tesVC.modalPresentationStyle = .fullScreen
        present(tesVC, animated: true, completion: nil)
    }
    
}


