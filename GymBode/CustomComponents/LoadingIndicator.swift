//
//  LoadingIndicator.swift
//  GymBode
//
//  Created by Can on 3.11.2022.
//

import UIKit

final class LoadingIndicator: UIActivityIndicatorView {
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        color = .white
        backgroundColor = .gray
        layer.cornerRadius = 6.0
        hidesWhenStopped = true
    }
}
