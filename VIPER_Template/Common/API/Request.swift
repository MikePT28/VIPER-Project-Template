//
//  Request.swift
//  VIPER
//
//  Created by Mike Pesate on 10/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

struct Request {
    let service: NetworkService
    
    var body: [String: Any]?
    var bodyData: Data? {
        if let json = body {
            return try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        }
        return nil
    }
    
    let headers: [String: String]?
    
    var url: URL {
        var queries = [URLQueryItem]()
        var urlComponents = URLComponents(url: self.service.url, resolvingAgainstBaseURL: true)!
        urlComponents.path.append(self.service.path)
        
        if let parameters = self.service.parameters {
            for parameter in parameters {
                queries.append(URLQueryItem(name: parameter.key, value: parameter.value as? String))
            }
            
            urlComponents.queryItems = queries
        }
        
        return URL(string: (urlComponents.url?.absoluteString.removingPercentEncoding!)!)!
    }
    let domain: String = Bundle.main.bundleIdentifier ?? "com.no.bundle"
}
