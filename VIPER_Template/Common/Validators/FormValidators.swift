//
//  EmailValidator.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

protocol EmailValidatable: StringValidatable { }
class EmailValidator: EmailValidatable {
    
    func validate(_ string: String) -> Bool {
        return (string.contains("@") && string.count > 3)
    }
    
}

protocol PasswordValidatable: StringValidatable { }
class PasswordValidator: PasswordValidatable {
    
    func validate(_ string: String) -> Bool {
        return string.count > 3
    }
    
}
