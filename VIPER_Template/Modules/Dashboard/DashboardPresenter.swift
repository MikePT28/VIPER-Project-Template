//
//  DashboardPresenter.swift
//  VIPER
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

protocol DashboardViewControllerProtocol: BaseViewControllerProtocol {
    
    func show(viewModel: Dashboard.ViewModel)
}

protocol DashboardPresenterProtocol: BasePresenterProtocol {
    
    func loadData()
    func performLogout()
    
}

class DashboardPresenter<T: DashboardViewControllerProtocol, U: DashboardRouterProtocol>: BasePresenter<T, U> {
    
    let data: Dashboard.Data
    
    init(viewController: T, router: U, data: Dashboard.Data) {
        self.data = data
        super.init(viewController: viewController, router: router)
    }
    
}

extension DashboardPresenter: DashboardPresenterProtocol {
    
    func loadData() {
        viewController.show(viewModel: Dashboard.ViewModel(name: data.name, lastName: data.lastName))
    }
    
    func performLogout() {
        router.back()
    }
    
}
