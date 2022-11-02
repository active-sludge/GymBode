//
//  ExerciseListViewModel.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import Combine

final class ExerciseListViewModel {
    private var bindings = Set<AnyCancellable>()
    private let service: ExerciseServicable
    
    @Published var exercises: [Exercise] = []
    
    init(service: ExerciseServicable = ExerciseService()) {
        self.service = service
    }
    
    func fetchExerciseList() {
        service
            .getExerciseList()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] response in
                self?.exercises = response.exercises
            }
            .store(in: &bindings)

    }
}
