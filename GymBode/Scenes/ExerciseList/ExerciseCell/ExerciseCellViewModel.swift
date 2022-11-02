//
//  ExerciseCellViewModel.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit

class ExerciseCellViewModel {
    let exerciseImage: UIImageView
    let title: String
    
    init(exerciseImage: UIImageView, title: String) {
        self.exerciseImage = exerciseImage
        self.title = title
    }
    
    init(with model: Exercise) {
        self.exerciseImage = UIImageView(image: UIImage(systemName: "figure.gymnastics"))
        self.title = model.name ?? "No title"
    }
}
