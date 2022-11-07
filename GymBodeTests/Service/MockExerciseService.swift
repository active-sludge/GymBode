//
//  MockExerciseService.swift
//  GymBodeTests
//
//  Created by Can on 7.11.2022.
//

import Foundation
import Combine
@testable import GymBode

class MockExerciseService: ExerciseServicable {
    func getExerciseList() -> AnyPublisher<GymBode.ExerciseListResponse, GymBode.NetworkError> {
        let sampleData = ExerciseApiTarget.getExerciseList.sampleData
        
        let publisher = CurrentValueSubject<GymBode.ExerciseListResponse, GymBode.NetworkError>(sampleData)
        
        return publisher.eraseToAnyPublisher()
    }
    
    func getExerciseDetail(with id: Int) -> AnyPublisher<GymBode.Exercise, GymBode.NetworkError> {
        
    }
}
