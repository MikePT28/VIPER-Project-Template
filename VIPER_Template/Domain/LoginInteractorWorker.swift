//
//  LoginInteractorWorker.swift
//  VIPER
//
//  Created by Mike Pesate on 10/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

protocol LoginInteractorWorkerProtocol: class {
    
    func doLogin(email: String, password: String)
}

protocol LoginInteractorWorkerCallbackProtocol: class {
    
    func loginSuccess(data: Login.Expected)
    func loginFailure(error: Login.Errors)
    
}

class LoginInteractorWorker {
    
    fileprivate let dispatcher: RequestDispatcherProtocol
    fileprivate unowned let interactor: LoginInteractorWorkerCallbackProtocol
    
    init(dispatcher: RequestDispatcherProtocol = RequestDispatcher(), interactor: LoginInteractorWorkerCallbackProtocol) {
        self.dispatcher = dispatcher
        self.interactor = interactor
    }
    
}

extension LoginInteractorWorker: LoginInteractorWorkerProtocol {
    
    func doLogin(email: String, password: String) {
        
        let request = Request(service: LoginNetworkService.login, body: nil, headers: nil)
        
        let handler: RequestDispatcherHanlder<Login.Expected> = { result in
            
            switch result {
            case .sucess(let data):
                self.interactor.loginSuccess(data: data)
            case .failure:
                self.interactor.loginFailure(error: Login.Errors.invalidCredentials)
                
            }
            
        }
        dispatcher.dispatch(request: request, completion: handler)
    }

}
