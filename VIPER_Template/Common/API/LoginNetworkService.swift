//
//  LoginNetworkService.swift
//  VIPER
//
//  Created by Mike Pesate on 10/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

enum LoginNetworkService {
    case login
        
}

extension LoginNetworkService: NetworkService {
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        }
    }
    
    var method: HTTPRequest {
        switch self {
        case .login:
            return .post
        }
    }
    
    var sampleData: Data? {
        switch self {
        case .login:
            return try? JSONSerialization.data(withJSONObject: ["name": "Jon", "lastName": "Doe"], options: .prettyPrinted)
        }
    }
}
