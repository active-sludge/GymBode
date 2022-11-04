//
//  BaseService.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import Foundation
import Combine

public protocol Requestable {
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
}

class BaseService: Requestable {
    func request<T>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError> where T : Decodable, T : Encodable {
        guard let url = URL(string: req.url) else {
            return AnyPublisher(Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url")))
        }
        
        return AnyPublisher(Fail(error: .unknown(code: 1, error: "Not implemented yet.")))
    }
}
