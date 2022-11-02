//
//  ExerciseListViewModel.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import Combine

protocol ExerciseListViewModeling {
    func fetchExerciseList()
}

class ExerciseListViewModel: ExerciseListViewModeling {
    private var bindings = Set<AnyCancellable>()
    private let service: ExerciseServicable
    
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
            } receiveValue: { response in
                dump(response.exercises)
            }
            .store(in: &bindings)

    }
}
