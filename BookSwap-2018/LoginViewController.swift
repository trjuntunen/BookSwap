//
//  ViewController.swift
//  BookSwap-2018
//
//  Created by Teddy Juntunen on 6/4/18.
//  Copyright © 2018 Teddy Juntunen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let inputDesign = InputFieldDesignManager()
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldDesign()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createNewAccountButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "createAccountSegue", sender: self)
    }
    
    private func setupTextFieldDesign() {
        let loginTextFieldBorderColor: CGColor = UIColor.groupTableViewBackground.cgColor
        inputDesign.setInputFieldDesign(component: usernameField, cornerRadius: 5, borderWidth: 0.8, borderColor: loginTextFieldBorderColor)
        inputDesign.setInputFieldDesign(component: passwordField, cornerRadius: 5, borderWidth: 0.8, borderColor: loginTextFieldBorderColor)
        inputDesign.setInputFieldDesign(component: loginButton, cornerRadius: 5, borderWidth: 0.8, borderColor: loginTextFieldBorderColor)
        
        let placeHolderTextColor: UIColor = UIColor.gray
        inputDesign.changePlaceHolderTextColor(textField: usernameField, color: placeHolderTextColor, text: "Username")
        inputDesign.changePlaceHolderTextColor(textField: passwordField, color: placeHolderTextColor, text: "Password")
        
        inputDesign.addLeftPaddingToTextField(textField: usernameField)
        inputDesign.addLeftPaddingToTextField(textField: passwordField)
    }
}

