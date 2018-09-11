//
//  UITextField+Molds.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import UIKit.UITextField

extension UITextField {

    open class var email: UITextField {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Email"
        field.keyboardType = .emailAddress
        return field
    }
    
    open class var password: UITextField {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "Password"
        field.keyboardType = .default
        field.isSecureTextEntry = true
        return field
    }

}
