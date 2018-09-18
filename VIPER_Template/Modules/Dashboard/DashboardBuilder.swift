//
//  DashboardBuilder.swift
//  VIPER
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation
import UIKit.UIViewController

final class DashboardBuilder {
    
    static func build(input: Login.Output) -> UIViewController {
        
        let data = Dashboard.Data(name: input.name, lastName: input.lastName)
        
        let viewController: DashboardViewController = DashboardViewController()
        let router: DashboardRouter = DashboardRouter(viewController: viewController)
        let presenter: DashboardPresenter = DashboardPresenter(viewController: viewController, router: router, data: data)
        viewController.presenter = presenter

        return viewController
    }
    
}
