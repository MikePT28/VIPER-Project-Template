//
//  LoginRouter.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

protocol LoginRouterProtocol: BaseRouterProtocol {
    
    func presentDashboard(output: Login.Output)
    
}

class LoginRouter: BaseRouter {

}

extension LoginRouter: LoginRouterProtocol {
    
    func presentDashboard(output: Login.Output) {
        viewController.present(DashboardBuilder.build(input: output), animated: true, completion: nil)
    }
    
}
