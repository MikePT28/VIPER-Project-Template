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
    var loginWorker: LoginInteractorWorkerAlias!
    
}

extension LoginInteractor: LoginInteractorProtocol {
    
    func doLogin(email: String, password: String) {
        
        loginWorker.execute(input: (email, password)) { (result) in
            
            switch result {
            case .success(let data):
                self.presenter.loginSuccess(data: data)
            case .failure(let error):
                self.presenter.loginFailure(error: error)
            }
            
        }
    }
    
}
