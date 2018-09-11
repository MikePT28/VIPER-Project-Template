//
//  LoginInteractor.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol: BaseInteractorProtocol {
    
    func doLogin(email: String, password: String)
    
}

protocol LoginInteractorCallbackProtocol: BaseInteractorCallbackProtocol {
    
    func loginSuccess(data: Login.Expected)
    func loginFailure(error: Login.Errors)
    
}

class LoginInteractor: BaseInteractor {
    
    weak var presenter: LoginInteractorCallbackProtocol!
    var loginWorker: LoginInteractorWorkerProtocol!
    
}

extension LoginInteractor: LoginInteractorProtocol {
    
    func doLogin(email: String, password: String) {
        
        loginWorker.doLogin(email: email, password: password)
    }
    
}

extension LoginInteractor: LoginInteractorWorkerCallbackProtocol {
    
    func loginSuccess(data: Login.Expected) {
        presenter.loginSuccess(data: data)
    }
    
    func loginFailure(error: Login.Errors) {
        presenter.loginFailure(error: error)
    }
    
}
