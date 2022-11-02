//
//  ExerciseService.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import Foundation

protocol ExerciseServicable {
    func getExerciseList()
    func getExerciseDetail(with id: Int)
}

class ExerciseService: ExerciseServicable {
    private var baseURLString: String = "https://wger.de/api/v2/"
    
    enum Path: String {
        case exerciseList = "/exerciseinfo"
    }
    
    func getExerciseList() {
        guard let url = URL(string: baseURLString + Path.exerciseList.rawValue) else { return }
        
        // TODO: - getExerciseList
    }
    
    func getExerciseDetail(with id: Int) {
        // TODO: - getExerciseDetail
        
    }
}
