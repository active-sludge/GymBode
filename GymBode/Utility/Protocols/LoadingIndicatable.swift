//
//  LoadingIndicatable.swift
//  GymBode
//
//  Created by Can on 3.11.2022.
//

import UIKit

protocol LoadingIndicatable: AnyObject {    
    func startAnimatingLoadingIndicator()
    func stopAnimatingLoadingIndicator()
}

extension LoadingIndicatable where Self: BaseViewController {
    func startAnimatingLoadingIndicator() {
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func stopAnimatingLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }
}
