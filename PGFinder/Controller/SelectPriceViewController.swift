//
//  SelectPriceViewController.swift
//  PGFinder
//
//  Created by Apple on 07/08/23.
//

import Foundation
import UIKit

class SelectPriceViewController : UIViewController {
    
    @IBOutlet weak var minimumRange: UIPickerView!
    
    @IBOutlet weak var maximumRange: UIPickerView!
    var priceRange: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Generate the price range array with a difference of 500 between each value
           let startPrice = 4000
           let endPrice = 15000
           for price in stride(from: startPrice, through: endPrice, by: 500) {
               priceRange.append(price)
           }
        minimumRange.delegate = self
        minimumRange.dataSource = self
        
        maximumRange.delegate = self
        maximumRange.dataSource = self
        
        // Set the maximum picker to select the last row by default
        let maxRow = priceRange.count - 1
        maximumRange.selectRow(maxRow, inComponent: 0, animated: false)
    }
}
    
    // MARK: UIPickerViewDelegate and UIPickerViewDataSource methods
extension SelectPriceViewController : UIPickerViewDelegate, UIPickerViewDataSource {
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1 // We are using a single component (column) in the picker
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return priceRange.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return "\(priceRange[row])"
       }
    
    // This function will be called when the user selects a row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == minimumRange {
            let selectedMinPrice = priceRange[row]
            // Do something with the selected minimum price
            
            // Check if the selected maximum value is less than the selected minimum value
            let selectedMaxRow = maximumRange.selectedRow(inComponent: 0)
            let selectedMaxPrice = priceRange[selectedMaxRow]
            if selectedMaxPrice < selectedMinPrice {
                // Adjust the selected row of the maximum picker to prevent it from being less than minimum
                let newRow = max(row, selectedMaxRow) // Ensure the new row is not less than the current selected row
                maximumRange.selectRow(newRow, inComponent: 0, animated: true)
            }
        } else if pickerView == maximumRange {
            let selectedMaxPrice = priceRange[row]
            // Do something with the selected maximum price
            
            // Check if the selected minimum value is greater than the selected maximum value
            let selectedMinRow = minimumRange.selectedRow(inComponent: 0)
            let selectedMinPrice = priceRange[selectedMinRow]
            if selectedMinPrice > selectedMaxPrice {
                // Adjust the selected row of the minimum picker to prevent it from being greater than maximum
                let newRow = min(row, selectedMinRow) // Ensure the new row is not greater than the current selected row
                minimumRange.selectRow(newRow, inComponent: 0, animated: true)
            }
        }
    }
       
       @IBAction func moveToMainScreenBtnTapped(_ sender: Any) {
           if let PGFinderMainScreen = storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as? UITabBarController {
               PGFinderMainScreen.modalPresentationStyle = .fullScreen
               present(PGFinderMainScreen, animated: true)
           }
       }
    
}
