//
//  ViewController.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import UIKit
import SwiftUI
import Combine

final class ExerciseListViewController: BaseViewController {
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
        
        viewModel.$state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                case .idle:
                    /// Present any view logic when the view is in idle status.
                    break
                case .loading:
                    self?.startAnimatingLoadingIndicator()
                case .finishedLoading:
                    self?.stopAnimatingLoadingIndicator()
                case .error(let error):
                    self?.presentAlertView(message: error.description)
                }
            }
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
        guard let id = viewModel.exercises[indexPath.row].id else { return }
        let viewModel = ExerciseDetailViewModel(id: id)
        let view = UIHostingController(rootView: ExerciseDetailView(viewModel: viewModel))
        navigationController?.pushViewController(view, animated: true)
    }
}
