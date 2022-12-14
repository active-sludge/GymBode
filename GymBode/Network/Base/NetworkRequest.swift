//
//  NetworkRequest.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import Foundation

/// Basis of a network request. Can be extended further with header, http method, body, request timeout.
public struct NetworkRequest {
    let url: String
    
    public init(url: String) {
        self.url = url
    }
    
    func buildURLRequest(with url: URL) -> URLRequest {
        return URLRequest(url: url)
    }
}

/// Can be extended with error types.
public enum NetworkError: Error, Equatable {
    case badURL(_ error: String)
    case unableToParseJSON(_ error: String)
    case unknown(code: Int, error: String)
}
