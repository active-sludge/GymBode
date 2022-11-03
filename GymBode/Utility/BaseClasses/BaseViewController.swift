//
//  BaseViewController.swift
//  GymBode
//
//  Created by Can on 3.11.2022.
//

import UIKit

class BaseViewController: UIViewController, LoadingIndicatable, AlertViewPresentable {
    // MARK: - Properties
    private (set) lazy var loadingIndicator: LoadingIndicator = LoadingIndicator(style: .medium)
    private var subviewList: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupSubviewConstraints()
    }
    
    // MARK: - Setup Sub Views
    private func setupSubviews() {
        /// Just append any custom views to subviewList below.
        subviewList.append(loadingIndicator)
        
        subviewList.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    ///
    private func setupSubviewConstraints() {
        setupLoadingIndicatorConstraints()
    }
    
    private func setupLoadingIndicatorConstraints() {
        NSLayoutConstraint.activate([
            loadingIndicator.widthAnchor.constraint(equalToConstant: 50.0),
            loadingIndicator.heightAnchor.constraint(equalToConstant: 50.0),
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
