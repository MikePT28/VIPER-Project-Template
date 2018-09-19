//
//  LoginInteractorWorker.swift
//  VIPER
//
//  Created by Mike Pesate on 10/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

typealias LoginInteractorWorkerAlias = BaseWorker<(String, String), Login.Expected, Login.Errors>
class LoginInteractorWorker: LoginInteractorWorkerAlias {
    
    fileprivate let dispatcher: RequestDispatcherProtocol
    
    init(dispatcher: RequestDispatcherProtocol = RequestDispatcher()) {
        self.dispatcher = dispatcher
    }
    
    override func job(input: (String, String)?, completion: @escaping ((WorkerResult<Login.Expected, Login.Errors>) -> Void)) {
        
        let request = Request(service: LoginNetworkService.login, body: nil, headers: nil)
        
        let handler: RequestDispatcherHanlder<Login.Expected> = { result in
            
            switch result {
            case .sucess(let data):
                completion(WorkerResult.success(data))
            case .failure:
                completion(WorkerResult.failure(Login.Errors.invalidCredentials))
                
            }
            
        }
        dispatcher.dispatch(request: request, completion: handler)
        
    }
    
}
