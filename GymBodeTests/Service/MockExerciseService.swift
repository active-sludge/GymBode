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
        let exerciseListResponse: ExerciseListResponse = testExercise(forResource: "getExercises")!
        let publisher = CurrentValueSubject<GymBode.ExerciseListResponse, GymBode.NetworkError>(exerciseListResponse)
        
        return publisher.eraseToAnyPublisher()
    }
    
    func getExerciseDetail(with id: Int) -> AnyPublisher<GymBode.Exercise, GymBode.NetworkError> {
        let exercise: Exercise = testExercise(forResource: "getExerciseDetail\(id)")!
        let publisher = CurrentValueSubject<GymBode.Exercise, GymBode.NetworkError>(exercise)
        
        return publisher.eraseToAnyPublisher()
    }
    
    private func testExercise<T: Codable>(forResource resource: String) -> T? {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: resource, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let model = try? JSONDecoder().decode(T.self, from: data)
        else { fatalError("Failed to load \(resource)") }
        
        return model
    }
}
