//
//  ViewController.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit

class ExerciseListViewController: UIViewController {
    
    @IBAction func fetchButton(_ sender: UIButton) {
    }
    
    var viewModel: ExerciseListViewModeling = ExerciseListViewModel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .purple
        
        
    }
}

