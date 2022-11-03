//
//  ExerciseCellViewModel.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit

final class ExerciseCellViewModel {
    public let exerciseImageURL: URL?
    public let title: String
    
    public init(with model: Exercise) {
        self.exerciseImageURL = URL(string: model.images?.first?.image ?? "")
        self.title = model.name ?? "No title"
    }
}
