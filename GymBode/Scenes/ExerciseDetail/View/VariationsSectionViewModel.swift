//
//  VariationsSectionViewModel.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import SwiftUI
import Combine

class VariationsSectionViewModel: ObservableObject {
    private var bindings = Set<AnyCancellable>()
    
    private (set) var variations: [Int]
    private let service: ExerciseServicable
    
    @Published var exercise: Exercise?
    
    init(variations: [Int], service: ExerciseServicable = ExerciseService()) {
        self.variations = variations
        self.service = service
    }
    
    func getExerciseDetail(id: Int) {
        service.getExerciseDetail(with: id)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    /// Failed
                    break
                case .finished:
                    /// Include any logic after the request is finished succesfully.
                    break
                }
            } receiveValue: { [weak self] response in
                self?.exercise = response
            }
            .store(in: &bindings)
            
    }
}
