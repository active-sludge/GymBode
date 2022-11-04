//
//  ExerciseService.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import Foundation
import Combine

enum ServiceError: Error {
    case url(URLError)
    case urlRequest
    case decode
}

protocol ExerciseServicable {
    func getExerciseList() -> AnyPublisher<ExerciseListResponse, Error>
    func getExerciseDetail(with id: Int)
}

final class ExerciseService {
    enum Path {
        case exerciseList
        case exerciseDetail(id: Int)
        
        var pathValue: String {
            switch self {
            case .exerciseList:
                return "exerciseinfo"
            case .exerciseDetail(id: let id):
                return "exerciseinfo/\(id)"
            }
        }
    }
    
    private func getUrlRequest(for path: Path) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "wger.de"
        components.path = "/api/v2/\(path.pathValue)"
        
        guard let url = components.url else { return nil }
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
}

extension ExerciseService: ExerciseServicable {
    
    func getExerciseList() -> AnyPublisher<ExerciseListResponse, Error> {
        var dataTask: URLSessionDataTask?
        
        let onSubscription: (Subscription) -> Void = { _ in dataTask?.resume() }
        let onCancel: () -> Void = { dataTask?.cancel() }
        
        return Future<ExerciseListResponse, Error> { [weak self] promise in
            guard let urlRequest = self?.getUrlRequest(for: .exerciseList) else {
                promise(.failure(ServiceError.urlRequest))
                return
            }

            dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
                guard let data = data else {
                    if let error = error {
                        promise(.failure(error))
                    }
                    return
                }
                do {
                    let exerciseListResponse = try JSONDecoder().decode(ExerciseListResponse.self, from: data)
                    promise(.success(exerciseListResponse))
                } catch {
                    promise(.failure(ServiceError.decode))
                }
            }
        }
        .handleEvents(receiveSubscription: onSubscription,
                      receiveCancel: onCancel)
        .receive(on: DispatchQueue.global())
        .eraseToAnyPublisher()
        
    }
    
    func getExerciseDetail(with id: Int) {
        // TODO: - getExerciseDetail
        
    }
}
