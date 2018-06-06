//
//  DatabaseController.swift
//  BookSwap-2018
//
//  Created by Teddy Juntunen on 6/4/18.
//  Copyright © 2018 Teddy Juntunen. All rights reserved.
//

import Foundation
import Firebase

class DatabaseController: UIViewController {
    
    var databaseReference: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     Attempts to add the given data to the Firebase database.
     */
    func addData(firstName: String, lastName: String, username: String, password: String, email: String) {
        if(accountCreationDataIsValid(firstName: firstName, lastName: lastName, username: username, password: password, email: email)) {
            databaseReference = Database.database().reference()
            databaseReference?.child("firstName").childByAutoId().setValue(firstName)
            databaseReference?.child("lastName").childByAutoId().setValue(lastName)
            databaseReference?.child("username").childByAutoId().setValue(username)
            databaseReference?.child("password").childByAutoId().setValue(password)
            databaseReference?.child("email").childByAutoId().setValue(email)
        }
    }
    
    /**
     Retrieves data from the Firebase database.
     */
        func retrieveData(username: String) -> String {
            var name: String = ""
            databaseHandle = databaseReference?.child("username").observe(.childAdded, with: { (snapshot) in
                name = (snapshot.value as? String)!
            })
            return name
        }
    
    /**
     Makes sure the data given when creating a new user account are the correct length,
     make sure the email has an @ symbol, and make sure the username or email are not already in the firebase database.
     */
    private func accountCreationDataIsValid(firstName: String, lastName: String, username: String, password: String, email: String) -> Bool {
            if(username == "" || password == "" || firstName == "" || lastName == "" || email == "" || !email.contains("@") || username.count > 15 || username.count < 5 || password.count > 15 || password.count < 5) {
                // also check if the username or email is in the database and if it is, then return false as well
                return false
            }
            return true
        }
}
