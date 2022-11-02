//
//  ViewController.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit
import SwiftUI

class ExerciseListViewController: UIViewController {
    private let cellReuseIdentifier = "ExerciseCell"

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
    }
}

extension ExerciseListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier,
                                                 for: indexPath)
        
        return cell
    }
}
