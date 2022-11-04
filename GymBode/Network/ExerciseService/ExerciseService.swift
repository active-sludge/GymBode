//
//  ExerciseService.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import Foundation
import Combine

protocol ExerciseServicable {
    func getExerciseList() // -> AnyPublisher<ExerciseListResponse, Error>
    func getExerciseDetail(with id: Int) // -> AnyPublisher<Exercise, Error>
}

final class ExerciseService: ExerciseServicable {
    
    func getExerciseList() { // -> AnyPublisher<ExerciseListResponse, Error> {
        // TODO: - call base service
    }
    
    func getExerciseDetail(with id: Int) { // -> AnyPublisher<Exercise, Error> {
        // TODO: - call base service
    }
}
