//
//  DashboardRouter.swift
//  VIPER
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

protocol DashboardRouterProtocol: BaseRouterProtocol {
    
    func back()
    
}

class DashboardRouter: BaseRouter {
    
}

extension DashboardRouter: DashboardRouterProtocol {
    
    func back() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}
