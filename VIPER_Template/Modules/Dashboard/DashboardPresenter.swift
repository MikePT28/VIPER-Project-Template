//
//  DashboardPresenter.swift
//  VIPER
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

protocol DashboardViewProtocol: BaseViewProtocol {
    
    func show(viewModel: Dashboard.ViewModel)
}

protocol DashboardPresenterProtocol: BasePresenterProtocol {
    
    func loadData()
    func performLogout()
    
}

class DashboardPresenter<T: DashboardViewProtocol, U: DashboardRouterProtocol>: BasePresenter<T, U> {
    
    let data: Dashboard.Data
    
    init(view: T, router: U, data: Dashboard.Data) {
        self.data = data
        super.init(view: view, router: router)
    }
    
}

extension DashboardPresenter: DashboardPresenterProtocol {
    
    func loadData() {
        view.show(viewModel: Dashboard.ViewModel(name: data.name, lastName: data.lastName))
    }
    
    func performLogout() {
        router.back()
    }
    
}
