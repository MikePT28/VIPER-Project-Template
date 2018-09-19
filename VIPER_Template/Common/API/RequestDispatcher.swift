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
    
    private static var manager: URLSession = {
        return URLSession.shared
    }()
    
    enum DispatchError: Error {
        case error(code: Int, message: String)
        case parsing(message: String?)
    }
    
    enum Result<T: Codable> {
        case sucess(data: T)
        case failure(error: DispatchError)
    }
    
    func dispatch<T: Codable>(request: Request, completion handler: @escaping (Result<T>) -> Void) {

        if useSampleData {
            process(data: request.service.sampleData, completion: handler)
            return
        }

        var mutRequest = URLRequest(url: request.url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        mutRequest.httpBody = request.bodyData
        mutRequest.httpMethod = request.service.method.rawValue
        
        RequestDispatcher.manager.dataTask(with: mutRequest) { (data, response, error) in
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                let message: String = error?.localizedDescription ?? "unknown"
                handler(Result<T>.failure(error: .error(code: response.statusCode, message: message)))
            }

            self.process(data: data, completion: handler)

        }

    }
    
    private func process<T>(data: Data?, completion handler: @escaping (Result<T>) -> Void) {
        guard let data = data else {
            handler(Result.failure(error: .parsing(message: "No data")))
            return
        }
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            handler(Result.sucess(data: model))
        } catch {
            handler(Result<T>.failure(error: .parsing(message: error.localizedDescription)))
        }
    }
    
}
