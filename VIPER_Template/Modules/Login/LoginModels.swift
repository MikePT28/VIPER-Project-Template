//
//  LoginModels.swift
//  VIPER
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

enum Login {
    
    enum Errors: Error {
        case invalidCredentials
        
        var localizedDescription: String {
            switch self {
            case .invalidCredentials:
                return "Username/Password may be incorrect"
            }
        }
    }
    
    struct Output {
        let name: String
        let lastName: String
    }
    
    struct Expected: Codable {
        let name: String
        let lastName: String
    }
}
