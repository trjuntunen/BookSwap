//
//  CreateAccountModalWindow.swift
//  BookSwap-2018
//
//  Created by Teddy Juntunen on 6/4/18.
//  Copyright © 2018 Teddy Juntunen. All rights reserved.
//

import UIKit

class CreateAccountModalWindow: UIViewController {
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    // Text fields to get information for new account
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    let inputDesign = InputFieldDesignManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the style for the text fields for account creation information
        self.setTextFieldDesign()
        
        // Dims the background behind the account creation modal window
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     When create account button tapped, attempt to add information to the database
     and then show a confirmation that account was created.
    */
    @IBAction func createAccountButtonTapped(_ sender: UIButton) {
        DatabaseController().addData(username: usernameField.text!, password: passwordField.text!, email: emailField.text!)
        // if sucessful, show confirmation message. if any fields are blank
        // or too few characters or too many characters then print message saying
        // invalid requirements for username password or email
    }
    
    /**
     Adds a darkgray border and left padding for all the text fields for
     account creation.
    */
    private func setTextFieldDesign() {
        let newAccountTextFieldBorderColor = UIColor.lightGray.cgColor
        
        // Add a 0.8 wide, darkgray border to all the text fields
        inputDesign.addBorderToComponent(component: usernameField, borderWidth: 0.8, color: newAccountTextFieldBorderColor)
        inputDesign.addBorderToComponent(component: passwordField, borderWidth: 0.8, color: newAccountTextFieldBorderColor)
        inputDesign.addBorderToComponent(component: emailField, borderWidth: 0.8, color: newAccountTextFieldBorderColor)
        
        inputDesign.roundInterfaceComponentCorners(component: usernameField, amount: 5)
        inputDesign.roundInterfaceComponentCorners(component: passwordField, amount: 5)
        inputDesign.roundInterfaceComponentCorners(component: emailField, amount: 5)
        inputDesign.roundInterfaceComponentCorners(component: createAccountButton, amount: 5)
        
        // Add left padding to all the text fields.
        inputDesign.addLeftPaddingToTextField(textField: usernameField)
        inputDesign.addLeftPaddingToTextField(textField: passwordField)
        inputDesign.addLeftPaddingToTextField(textField: emailField)
        
    }
    
}
