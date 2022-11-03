//
//  ExerciseListResponse.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import Foundation

struct ExerciseListResponse: Codable {
    let exercises: [Exercise]
    
    enum CodingKeys: String, CodingKey {
        case exercises = "results"
    }
}

// MARK: - Result
struct Exercise: Codable {
    let id: Int?
    let name: String?
    let images: [Image]?
    let variations: [Int]?
}

struct Image: Codable {
    let image: String?
}
