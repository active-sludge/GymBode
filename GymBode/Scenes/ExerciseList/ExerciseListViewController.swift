//
//  ViewController.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit
import SwiftUI
import Combine

final class ExerciseListViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - IBActions
    @IBAction private func didTapRefresh(_ sender: UIBarButtonItem) {
        viewModel.fetchExerciseList()
    }
    
    // MARK: - Properties
    private var viewModel = ExerciseListViewModel()
    private var bindings = Set<AnyCancellable>()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        setupBindings()
        setupTableView()
    }
    
    // MARK: - Setup Methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExerciseCell.nib(), forCellReuseIdentifier: ExerciseCell.reuseIdentifier)
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        viewModel.$exercises
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .store(in: &bindings)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ExerciseListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ExerciseCell.rowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.reuseIdentifier,
                                                       for: indexPath) as? ExerciseCell else {
            return UITableViewCell()
        }
        
        let viewModel = ExerciseCellViewModel(with: viewModel.exercises[indexPath.row])
        cell.configureCell(with: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.exercises[indexPath.row]
        let viewModel = ExerciseDetailViewModel(with: model)
        let view = UIHostingController(rootView: ExerciseDetailView(viewModel: viewModel))
        navigationController?.pushViewController(view, animated: true)
    }
}
