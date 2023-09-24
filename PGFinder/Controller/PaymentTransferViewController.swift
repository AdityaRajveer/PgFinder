//
//  PaymentTransferViewController.swift
//  PGFinder
//
//  Created by Apple on 24/09/23.
//

import Foundation
import UIKit

class PaymentTransferViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var bhimCircle: UIButton!
    
    @IBOutlet weak var payTmCircle: UIButton!
    @IBOutlet weak var phonepeCircle: UIButton!
    @IBOutlet weak var googlePayCircle: UIButton!
    @IBOutlet weak var amazonPayCircle: UIButton!
    
    @IBOutlet weak var payeeMerchantCode: UITextField!
    @IBOutlet weak var payeeVPA: UITextField!
    @IBOutlet weak var payeeName: UITextField!
    @IBOutlet weak var descriptionText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionText.delegate = self
        payeeName.delegate = self
        payeeVPA.delegate = self
        payeeMerchantCode.delegate = self
        
        let paymentOptionGif = UIImage.gifImageWithName("paymentOptions")
            imageView.image = paymentOptionGif
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true

        }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // Check if the editing text field is not equal to descriptionText
        if textField != descriptionText {
            // Assuming you want to prevent empty text fields
            if textField.text?.isEmpty == true {
                // Display an error message, prevent the user from switching to another text field
                let alert = UIAlertController(title: "Error", message: "Text field cannot be empty.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                
                // Return false to prevent ending editing and switching to another text field
                return false
            }
        }
        
        // Allow ending editing and switching to another text field
        return true
    }
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Dismiss the keyboard
        view.endEditing(true)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func paymentButtonPressed(_ sender: UIButton) {
        // Reset all circle buttons to the normal state
             bhimCircle.isSelected = false
             payTmCircle.isSelected = false
             phonepeCircle.isSelected = false
             googlePayCircle.isSelected = false
             amazonPayCircle.isSelected = false

             // Set the selected state for the pressed button
             sender.isSelected = true

             // You can change the image for the selected state here
             sender.setImage(UIImage(systemName: "circle.fill"), for: .selected)
         }
    
    @IBAction func continueToPay(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
