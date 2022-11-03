//
//  ExerciseDetailViewModel.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import SwiftUI

class ExerciseDetailViewModel: ObservableObject {
    @Published var imageURLs: [String]
    @Published var title: String
    @Published var variations: [Int]
    
    init(with model: Exercise) {
        self.title = model.name ?? "No Title"
        self.variations = model.variations ?? []
        self.imageURLs = model.images?.compactMap({ image in
            image.image
        }) ?? []
    }
}
