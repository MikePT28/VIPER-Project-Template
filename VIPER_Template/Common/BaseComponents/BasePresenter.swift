//
//  BasePresenter.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

public protocol BaseViewProtocol: class { }

public protocol BasePresenterProtocol: class { }

public class BasePresenter<T: BaseViewProtocol, U: BaseRouterProtocol> {
    
    internal unowned let view: T
    internal let router: U
    
    init(view: T, router: U) {
        self.view = view
        self.router = router
    }
    
}
