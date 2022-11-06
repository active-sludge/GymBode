//
//  ExerciseListResponse.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import Foundation

public struct ExerciseListResponse: Codable {
    public let exercises: [Exercise]
    
    enum CodingKeys: String, CodingKey {
        case exercises = "results"
    }
}

public struct Exercise: Codable {
    public let id: Int?
    public let name: String?
    public let images: [Image]?
    public let variations: [Int]?
}

public struct Image: Codable {
    public let image: String?
}
