//
//  ViewController.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit

class ExerciseListViewController: UIViewController {
    
    @IBAction func didTapRefresh(_ sender: UIBarButtonItem) {
        viewModel.fetchExerciseList()
    }
    
    var viewModel: ExerciseListViewModeling = ExerciseListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
            
    }
}

