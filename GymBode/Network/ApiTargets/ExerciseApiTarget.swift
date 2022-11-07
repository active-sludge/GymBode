//
//  ExerciseServiceEndpoints.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import Foundation

enum ExerciseApiTarget {
    case getExerciseList
    case getExerciseDetail(id: Int)
}

extension ExerciseApiTarget: ApiTargetable {
    // Can be extended by introducing environment as a variable
    var baseURL: String {
        "https://wger.de/api/v2/"
    }
    
    /// Returns the endpoint of selected endpoint
    var endpoint: String {
        switch self {
        case .getExerciseList:
            return "exerciseinfo"
        case .getExerciseDetail(let id):
            return "exerciseinfo/\(id)"
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getExerciseList:
            return Data()
        case .getExerciseDetail:
            return Data()
        }
    }
}
