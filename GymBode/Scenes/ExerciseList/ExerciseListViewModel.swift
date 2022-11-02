//
//  ExerciseListViewModel.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import Foundation

protocol ExerciseListViewModeling {
    func fetchExerciseList()
}

class ExerciseListViewModel: ExerciseListViewModeling {
    let service: ExerciseServicable
    
    init(service: ExerciseServicable = ExerciseService()) {
        self.service = service
    }
    
    func fetchExerciseList() {
        service.getExerciseList()
    }
}
