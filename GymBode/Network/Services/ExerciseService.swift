//
//  ExerciseService.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import Foundation
import Combine

protocol ExerciseServicable {
    func getExerciseList() -> AnyPublisher<ExerciseListResponse, NetworkError>
    func getExerciseDetail(with id: Int) // -> AnyPublisher<Exercise, NetworkError>
}

final class ExerciseService: ExerciseServicable {
    let service: Requestable
    
    init(service: Requestable = BaseService()) {
        self.service = service
    }
    
    func getExerciseList() -> AnyPublisher<ExerciseListResponse, NetworkError> {
        // TODO: - call base service
        let endpoint = ExerciseServiceApi.getExerciseList
        return service.request(endpoint)
    }
    
    func getExerciseDetail(with id: Int) { // -> AnyPublisher<Exercise, NetworkError> {
        // TODO: - call base service
    }
}
