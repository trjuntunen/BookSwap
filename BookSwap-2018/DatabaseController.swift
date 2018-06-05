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
     Adds the given data to the Firebase database.
     */
    func addData(username: String, password: String, email: String) {
        databaseReference = Database.database().reference()
        
        if(accountCreationDataIsValid(username: username, password: password, email: email, databaseReference: databaseReference!)) {
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
    private func accountCreationDataIsValid(username: String, password: String, email: String, databaseReference: DatabaseReference) -> Bool {
        if(!email.contains("@") || (username.count < 5 || username.count > 13) || (password.count < 5 || password.count > 13) || (email.count < 5 || email.count > 25)) {
            return false
        }
        print(retrieveData(username: username))
        return true
    }
    
}
