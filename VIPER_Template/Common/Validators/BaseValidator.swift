//
//  BaseValidator.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

protocol Validatable { }

protocol StringValidatable: Validatable {
    func validate(_ string: String) -> Bool
}
