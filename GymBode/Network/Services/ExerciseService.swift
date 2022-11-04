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
        let request = ExerciseServiceEndpoints.getExerciseList.request
        return service.request(request)
    }
    
    func getExerciseDetail(with id: Int) { // -> AnyPublisher<Exercise, NetworkError> {
        // TODO: - call base service
    }
}
