//
//  LoginBuilder.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation
import UIKit.UIViewController

final class LoginBuilder {
    
    static func build() -> UIViewController {
        
        let viewController: LoginViewController = LoginViewController()
        let router: LoginRouter = LoginRouter(viewController: viewController)
        let loginInteractor = LoginInteractor()
        let presenter: LoginPresenter = LoginPresenter(viewController: viewController, router: router, loginInteractor: loginInteractor)
        loginInteractor.presenter = presenter
        loginInteractor.loginWorker = LoginInteractorWorker()
        viewController.presenter = presenter
        
        return viewController
    }
    
}
