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
        
        let view: DashboardView = DashboardView()
        let router: DashboardRouter = DashboardRouter(view: view)
        let presenter: DashboardPresenter = DashboardPresenter(view: view, router: router, data: data)
        view.presenter = presenter

        return view
    }
    
}
