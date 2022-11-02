//
//  ExerciseCell.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit

final class ExerciseCell: UITableViewCell {
    public static let rowHeight: CGFloat = 120.0
    public static let reuseIdentifier = String(describing: ExerciseCell.self)
    
    public static func nib() -> UINib {
        UINib(nibName: ExerciseCell.reuseIdentifier, bundle: nil)
    }
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailDiscloseImageView: UIImageView!
    
    func configureCell(with viewModel: ExerciseCellViewModel) {
        leftImageView = viewModel.exerciseImage
        titleLabel.text = viewModel.title
        detailDiscloseImageView.image = UIImage(systemName: "chevron.right")
    }
}
