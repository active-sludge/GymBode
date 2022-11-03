//
//  AlertViewPresentable.swift
//  GymBode
//
//  Created by Can on 3.11.2022.
//

import UIKit

protocol AlertViewPresentable: AnyObject {
    func presentAlertView(title: String, message: String)
}

extension AlertViewPresentable where Self: BaseViewController {
    func presentAlertView(title: String = "Alert", message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Ok",
                                                style: .default,
                                                handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
