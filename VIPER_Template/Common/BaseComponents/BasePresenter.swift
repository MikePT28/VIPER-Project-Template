//
//  BasePresenter.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

public protocol BaseViewControllerProtocol: class { }

public protocol BasePresenterProtocol: class { }

public class BasePresenter<T: BaseViewControllerProtocol, U: BaseRouterProtocol> {

    internal unowned let viewController: T
    internal let router: U

    init(viewController: T, router: U) {
        self.viewController = viewController
        self.router = router
    }

}
