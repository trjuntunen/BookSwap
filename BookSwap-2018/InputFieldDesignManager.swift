//
//  InputFieldDesignManager.swift
//  BookSwap-2018
//
//  Created by Teddy Juntunen on 6/4/18.
//  Copyright © 2018 Teddy Juntunen. All rights reserved.
//

import UIKit

class InputFieldDesignManager {
    
    /**
     Uses helper methods to set the design the for input fields on the login screen.
     Includes rounding the corners, and if it's a button, then adding left padding
     and setting the border.
     */
    func setInputFieldDesign(component: UIControl, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor) {
        roundInterfaceComponentCorners(component: component, amount: cornerRadius)
        if(!component.isKind(of: UIButton.self)) {
            addBorderToComponent(component: component, borderWidth: borderWidth, color: borderColor)
            addLeftPaddingToTextField(textField: component as! UITextField)
        }
    }
    
    /**
     Helper method for setInputFieldDesign() function to round the corners
     for a UI component for the given amount.
     */
    private func roundInterfaceComponentCorners(component: UIControl, amount: CGFloat) {
        component.layer.cornerRadius = amount
    }
    
    /**
     Helper method for setInputFieldDesign() function to add a light border with a given width to
     a UI component.
     */
    private func addBorderToComponent(component: UIControl, borderWidth: CGFloat, color: CGColor) {
        if(!component.isKind(of: UIButton.self)) {
            component.layer.borderWidth = borderWidth
            component.layer.borderColor = color
        }
    }
    
    /**
     Adds a little left padding to the text fields.
     */
    private func addLeftPaddingToTextField(textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        textField.leftViewMode = .always
        textField.leftView = paddingView
    }
    
    /**
     Changes the given text field text to the given color.
    */
    func changePlaceHolderTextColor(textField: UITextField, color: UIColor, text: String) {
        textField.attributedPlaceholder = NSAttributedString(string: text,
                                                             attributes: [NSAttributedStringKey.foregroundColor: color])
    }
}

extension UIViewController {
    func hideKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
