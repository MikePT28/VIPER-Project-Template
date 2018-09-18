//
//  BaseWorker.swift
//  VIPER
//
//  Created by Mike Pesate on 9/5/18.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

enum NoError: Error {}

enum WorkerResult<R, E> where E: Error {
    case success(R)
    case failure(E)
}

class BaseWorker <I, R, E> where E: Error {
    
    func run(input: I? = nil, completion: @escaping ((WorkerResult<R, E>) -> Void) ) {
        fatalError("Worker is an abstract class, you should implement your own")
    }

// Uncomment when promises are inserted to the project
//    final func run(input: I? = nil) -> Promise<R> {
//        return Promise { seal in
//            self.run(input: input, completion: { (result) in
//                switch result {
//                case .success(let r):
//                    seal.fulfill(r)
//                case .failure(let error):
//                    seal.reject(error)
//                }
//            })
//        }
//    }
}
