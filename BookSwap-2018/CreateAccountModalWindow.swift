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
        self.hideKeyboardOnTap()
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let location = touch?.location(in: self.view) else { return }
        if(!containerView.frame.contains(location)) {
           dismiss(animated: true, completion: nil)
        }
    }
    
    /**
     Adds a darkgray border and left padding for all the text fields for
     account creation.
     */
    private func setTextFieldDesign() {
        let lightgray = UIColor.lightGray.cgColor
        
        // Add a 0.8 wide, darkgray border to all the text fields.
        inputDesign.setInputFieldDesign(component: firstName, cornerRadius: 5, borderWidth: 0.8, borderColor: lightgray)
        inputDesign.setInputFieldDesign(component: lastName, cornerRadius: 5, borderWidth: 0.8, borderColor: lightgray)
        inputDesign.setInputFieldDesign(component: username, cornerRadius: 5, borderWidth: 0.8, borderColor: lightgray)
        inputDesign.setInputFieldDesign(component: password, cornerRadius: 5, borderWidth: 0.8, borderColor: lightgray)
        inputDesign.setInputFieldDesign(component: email, cornerRadius: 5, borderWidth: 0.8, borderColor: lightgray)
        inputDesign.setInputFieldDesign(component: retypedEmailed, cornerRadius: 5, borderWidth: 0.8, borderColor: lightgray)
        
    }
    
}
