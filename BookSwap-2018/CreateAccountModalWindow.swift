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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var retypedEmailed: UITextField!
    
    let inputDesign = InputFieldDesignManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the style for the text fields for account creation information.
        self.setTextFieldDesign()
        
        containerView.layer.cornerRadius = 5
        
        // Dims the background behind the account creation modal window.
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
        DatabaseController().addData(firstName: firstName.text!, lastName: lastName.text!, username: username.text!, password: password.text!, email: email.text!)
        // if sucessful, show confirmation message. if any fields are blank
        // or too few characters or too many characters then print message saying
        // invalid requirements for username password or email
    }
    
    /**
     Adds a darkgray border and left padding for all the text fields for
     account creation.
     */
    private func setTextFieldDesign() {
        let lightgray = UIColor.lightGray.cgColor
        
        // Add a 0.8 wide, darkgray border to all the text fields.
        inputDesign.addBorderToComponent(component: firstName, borderWidth: 0.8, color: lightgray)
        inputDesign.addBorderToComponent(component: lastName, borderWidth: 0.8, color: lightgray)
        inputDesign.addBorderToComponent(component: username, borderWidth: 0.8, color: lightgray)
        inputDesign.addBorderToComponent(component: password, borderWidth: 0.8, color: lightgray)
        inputDesign.addBorderToComponent(component: email, borderWidth: 0.8, color: lightgray)
        inputDesign.addBorderToComponent(component: retypedEmailed, borderWidth: 0.8, color: lightgray)
        
        // round the corners of the textboxes.
        inputDesign.roundInterfaceComponentCorners(component: firstName, amount: 5)
        inputDesign.roundInterfaceComponentCorners(component: lastName, amount: 5)
        inputDesign.roundInterfaceComponentCorners(component: username, amount: 5)
        inputDesign.roundInterfaceComponentCorners(component: password, amount: 5)
        inputDesign.roundInterfaceComponentCorners(component: email, amount: 5)
        inputDesign.roundInterfaceComponentCorners(component: retypedEmailed, amount: 5)
        inputDesign.roundInterfaceComponentCorners(component: createAccountButton, amount: 5)
        
        // Add left padding to all the text fields.
        inputDesign.addLeftPaddingToTextField(textField: firstName)
        inputDesign.addLeftPaddingToTextField(textField: lastName)
        inputDesign.addLeftPaddingToTextField(textField: username)
        inputDesign.addLeftPaddingToTextField(textField: password)
        inputDesign.addLeftPaddingToTextField(textField: email)
        inputDesign.addLeftPaddingToTextField(textField: retypedEmailed)
        
    }
    
}
