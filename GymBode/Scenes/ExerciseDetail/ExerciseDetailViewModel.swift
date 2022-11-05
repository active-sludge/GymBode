//
//  ExerciseDetailViewModel.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import SwiftUI
import Combine

class ExerciseDetailViewModel: ObservableObject {
    private var bindings = Set<AnyCancellable>()
    private let service: ExerciseServicable
    
    @Published private (set) var imageURLs: [String] = []
    @Published private (set)  var title: String = ""
    @Published private (set)  var variations: [Int] = []
    @Published var state: ExerciseDetailViewModelStates = .idle
    
    private (set) var id: Int
    private (set) var exercise: Exercise? {
        didSet {
            self.imageURLs = exercise?.images?.map({ $0.image ?? "" }) ?? []
            self.title = exercise?.name ?? ""
            self.variations = exercise?.variations ?? []
        }
    }
    
    init(id: Int, service: ExerciseServicable = ExerciseService()) {
        self.id = id
        self.service = service
    }
    
    func getExerciseDetail(with id: Int) {
        state = .loading
        
        service.getExerciseDetail(with: id)
            .sink { [weak self] completion in
                self?.state = .finishedLoading
                switch completion {
                case .failure(let error):
                    self?.state = .error(message: error.localizedDescription)
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

extension ExerciseDetailViewModel {
    enum ExerciseDetailViewModelStates: Equatable {
        case idle
        case loading
        case finishedLoading
        case error(message: String)
    }
}
