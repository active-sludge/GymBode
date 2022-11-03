//
//  BaseViewController.swift
//  GymBode
//
//  Created by Can on 3.11.2022.
//

import UIKit


class BaseViewController: UIViewController, LoadingIndicatable {
    private (set) lazy var loadingIndicator: LoadingIndicator = LoadingIndicator(style: .medium)
    private var subViews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupLoadingIndicator()
    }
    
    private func setupSubviews() {
        subViews.append(loadingIndicator)
        subViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setupLoadingIndicator() {
        NSLayoutConstraint.activate([
            loadingIndicator.widthAnchor.constraint(equalToConstant: 50.0),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 50.0),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
