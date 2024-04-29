//
//  PGOwnerViewController.swift
//  PGFinder
//
//  Created by Apple on 07/08/23.
//

import Foundation
import UIKit

class PGOwnerViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    
    @IBOutlet weak var showPasswordBtn: UIButton!
    
    @IBOutlet weak var continueTotheNextScrn: UIButton!
    
    @IBOutlet weak var createAccount: UIButton!
    
    @IBOutlet weak var signInWithGoogle: UIButton!
    @IBOutlet weak var signInWithAppleId: UIButton!
    
    @IBOutlet var mainUIView: UIView!
    override func viewDidLoad() {
            super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mainUIView.addGestureRecognizer(tapGesture)
        mainUIView.isUserInteractionEnabled = true

        }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwordTextField {
            // Trim whitespace characters from the password field
            if let trimmedText = textField.text?.trimmingCharacters(in: .whitespaces) {
                textField.text = trimmedText
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        // Dismiss the keyboard
        view.endEditing(true)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        // Create left and right padding views for each text field
        let leftPaddingViewEmail = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextField.frame.height))
        let rightPaddingViewEmail = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextField.frame.height))

        let leftPaddingViewPassword = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        let rightPaddingViewPassword = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: passwordTextField.frame.height))

        // Assign the padding views to their respective text fields
        emailTextField.leftView = leftPaddingViewEmail
        emailTextField.leftViewMode = .always
        emailTextField.rightView = rightPaddingViewEmail
        emailTextField.rightViewMode = .always

        passwordTextField.leftView = leftPaddingViewPassword
        passwordTextField.leftViewMode = .always
        passwordTextField.rightView = rightPaddingViewPassword
        passwordTextField.rightViewMode = .always
    }

    
    
    func setUpUI() {
        // Set the textfield corner radius
        emailTextField.layer.cornerRadius = emailTextField.frame.height / 2
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2

        // Set the textfield border color and width
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 2
        
        //set the textfield text's Font
        emailTextField.font = UIFont(name: "Helvetica", size: 14)
        passwordTextField.font = UIFont(name: "Helvetica", size: 14)
        
        //set the textfield tint colour
        emailTextField.tintColor = .darkGray
        passwordTextField.tintColor = .darkGray

        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 2
       
        // Remove the textfield default border style
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        

        // Set the textfield placeholder text
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        
        //secure the text entry in password field
        passwordTextField.isSecureTextEntry = true
   }
    
    @IBAction func showPasswordAction(_ sender: Any) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
}
