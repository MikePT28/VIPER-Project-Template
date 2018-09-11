//
//  File.swift
//  VIPER
//
//  Created by Mike Pesate on 10/09/2018.
//  Copyright © 2018 Mike Pesate. All rights reserved.
//

import Foundation

enum HTTPRequest: String, RawRepresentable {
    typealias RawValue = String
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

protocol NetworkService {
    
    /// The target's base `URL`.
    var url: URL { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }
    
    /// The HTTP method used in the request.
    var method: HTTPRequest { get }
    
    /// The parameters to be encoded in the request.
    var parameters: [String: Any]? { get }
    
    /// Provides stub data for use in testing.
    var sampleData: Data? { get }
    
}

//Constants
extension NetworkService {
    
    var url: URL {
        return URL(string: "https://www.google.com")!
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var sampleData: Data? {
        return nil
    }
    
}
