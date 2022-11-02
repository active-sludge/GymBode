//
//  ExerciseCellViewModel.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit

final class ExerciseCellViewModel {
    let exerciseImage: UIImage
    let title: String
    
    init(exerciseImage: UIImage, title: String) {
        self.exerciseImage = exerciseImage
        self.title = title
    }
    
    init(with model: Exercise) {
        self.exerciseImage = UIImage(systemName: "figure.gymnastics")!
        self.title = model.name ?? "No title"
    }
}
