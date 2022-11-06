//
//  BaseService.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import Foundation
import Combine

public protocol Requestable {
    func request<T: Codable>(_ endPoint: ApiTargetable) -> AnyPublisher<T, NetworkError>
}

class BaseService: Requestable {
    func request<T>(_ endPoint: ApiTargetable) -> AnyPublisher<T, NetworkError> where T : Decodable, T : Encodable {
        guard let url = URL(string: endPoint.fullURL) else {
            return AnyPublisher(Fail<T, NetworkError>(error: NetworkError.badURL("Invalid Url")))
        }
        
        return URLSession.shared.dataTaskPublisher(for: endPoint.request.buildURLRequest(with: url))
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error in
                NetworkError.unableToParseJSON(error.localizedDescription)
            })
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
