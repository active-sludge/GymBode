//
//  ViewController.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit
import SwiftUI

class ExerciseListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func didTapRefresh(_ sender: UIBarButtonItem) {
        viewModel.fetchExerciseList()
    }
    
    var viewModel: ExerciseListViewModeling = ExerciseListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExerciseCell.nib(), forCellReuseIdentifier: ExerciseCell.reuseIdentifier)
    }
}

extension ExerciseListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ExerciseCell.rowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: - Populate from viewModel
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.reuseIdentifier,
                                                       for: indexPath) as? ExerciseCell else {
            return UITableViewCell()
        }
        
        // TODO: - Populate from viewModel
        let viewModel = ExerciseCellViewModel(with: Exercise(id: 1, name: "hello", images: []))
        cell.configureCell(with: viewModel)
        
        return cell
    }
}
