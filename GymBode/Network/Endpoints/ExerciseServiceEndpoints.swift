//
//  ExerciseServiceEndpoints.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import Foundation

enum ExerciseServiceEndpoints {
    case getExerciseList
    case getExerciseDetail(id: Int)
}

extension ExerciseServiceEndpoints {
    // Can be extended by introducing environment as a variable
    var baseURL: String {
        "https://wger.de/api/v2"
    }
    
    /// Returns the endpoint of selected endpoint
    var urlString: String {
        switch self {
        case .getExerciseList:
            return "\(baseURL)/exerciseinfo"
        case .getExerciseDetail(let id):
            return "\(baseURL)/exerciseinfo/\(id)"
        }
    }
    
    /// Returns a network request from the given urlString
    var request: NetworkRequest {
        return NetworkRequest(url: urlString)
    }
}
