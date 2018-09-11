//
//  LoginMocks.swift
//  VIPERTests
//
//  Created by Mike Pesate on 06/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation
@testable import VIPER_Template

class LoginInteractorSuccessMock: LoginInteractorProtocol {
    var presenter: LoginInteractorCallbackProtocol!
    
    func doLogin(email: String, password: String) {
        presenter.loginSuccess(data: Login.Expected(name: "Jon", lastName: "Doe"))
    }
    
}

class LoginInteractorFailureMock: LoginInteractorProtocol {
    var presenter: LoginInteractorCallbackProtocol!
    
    func doLogin(email: String, password: String) {
        presenter.loginFailure(error: .invalidCredentials)
    }
    
}

class LoginInteractorWorkerSuccessMock: LoginInteractorWorkerProtocol {
    unowned let interactor: LoginInteractorWorkerCallbackProtocol
    
    init(interactor: LoginInteractorWorkerCallbackProtocol) {
        self.interactor = interactor
    }
    
    func doLogin(email: String, password: String) {
        interactor.loginSuccess(data: Login.Expected(name: "Jon", lastName: "Doe"))
    }
}

class LoginInteractorWorkerFailureMock: LoginInteractorWorkerProtocol {
    unowned let interactor: LoginInteractorWorkerCallbackProtocol
    
    init(interactor: LoginInteractorWorkerCallbackProtocol) {
        self.interactor = interactor
    }
    
    func doLogin(email: String, password: String) {
        interactor.loginFailure(error: .invalidCredentials)
    }
}
