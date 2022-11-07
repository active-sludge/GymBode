//
//  Endpointable.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import Foundation

public protocol ApiTargetable {
    var baseURL: String { get }
    var endpoint: String { get }
    var fullURL: String { get }
    var sampleData: Data { get }
    var request: NetworkRequest { get }
}

public extension ApiTargetable {
    var fullURL: String {
        baseURL + endpoint
    }
    
    var request: NetworkRequest {
        NetworkRequest(url: fullURL)
    }
    
    var sampleData: Data {
        Data()
    }
}
