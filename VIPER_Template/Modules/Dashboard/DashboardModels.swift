//
//  DashboardModels.swift
//  VIPER
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

enum Dashboard {
    
    struct Setup {
        let name: String
        let lastName: String
    }
    
    class Data {
        let name: String
        let lastName: String
        
        init(name: String, lastName: String) {
            self.name = name
            self.lastName = lastName
        }
    }
    
    struct ViewModel {
        let name: String
        let lastName: String
    }
}
