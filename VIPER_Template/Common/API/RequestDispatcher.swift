//
//  RequestDispatcher.swift
//  VIPER
//
//  Created by Mike Pesate on 10/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

typealias RequestDispatcherHanlder<T: Codable> = ((RequestDispatcher.Result<T>) -> Void)

protocol RequestDispatcherProtocol {
    func dispatch<T: Codable>(request: Request, completion handler: @escaping RequestDispatcherHanlder<T>)
}

class RequestDispatcher: RequestDispatcherProtocol {
    
    private let useSampleData: Bool = true
    
    enum DispatchError: Error {
        case error(code: Int, message: String)
        case parsing
    }
    
    enum Result<T: Codable> {
        case sucess(data: T)
        case failure(error: DispatchError)
    }
    
    func dispatch<T: Codable>(request: Request, completion handler: @escaping (Result<T>) -> Void) {

        if useSampleData {
            if let sample = request.service.sampleData,
                let response = try? JSONDecoder().decode(T.self, from: sample) {
                handler(Result.sucess(data: response))
                
            } else {
                handler(Result.failure(error: .parsing))
                
            }
            return
        }

        var mutRequest = URLRequest(url: request.url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        mutRequest.httpBody = request.bodyData
        mutRequest.httpMethod = request.service.method.rawValue
        URLSession.shared.dataTask(with: mutRequest) { (data, response, error) in
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                let message: String = error?.localizedDescription ?? "unknown"
                handler(Result<T>.failure(error: .error(code: response.statusCode, message: message)))
            }

            guard let data = data, let model = try? JSONDecoder().decode(T.self, from: data) else {
                handler(Result<T>.failure(error: .parsing))
                return
            }

            handler(Result.sucess(data: model))

        }

    }
    
}
