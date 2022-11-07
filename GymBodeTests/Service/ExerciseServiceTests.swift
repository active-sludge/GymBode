//
//  ExerciseServiceTests.swift
//  GymBodeTests
//
//  Created by Can on 7.11.2022.
//

import XCTest
import Combine
@testable import GymBode

final class ExerciseServiceTests: XCTestCase {
    private var sut: MockExerciseService!
    private var bindings = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        sut = MockExerciseService()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testExerciseServiceSubscriberReceivesExerciseListResponse() throws {
        // Given
        var result: ExerciseListResponse!
        let expectedListItemCount = 20
        let firstItemId = 345
        
        // When
        sut.getExerciseList()
            .sink { completion in
                switch completion {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { response in
                result = response
            }
            .store(in: &bindings)
        
        // Then
        XCTAssertEqual(result.exercises.count, expectedListItemCount)
        XCTAssertEqual(result.exercises.first?.id, firstItemId)
    }
    
    func testExerciseServiceSubscriberReceivesExerciseWithGivenId() throws {
        // Given
        var result: Exercise!
        let exerciseID = 15
        
        let expectedID = 15
        let expectedName = "Bankdrücken LH"
        let expectedFirstImage = "https://wger.de/media/exercise-images/192/Bench-press-1.png"
        let expectedFirstVariationID = 77
        
        // When
        sut.getExerciseDetail(with: exerciseID)
            .sink { completion in
                switch completion {
                case .failure(_):
                    break
                case .finished:
                    break
                }
            } receiveValue: { response in
                result = response
            }
            .store(in: &bindings)
        
        // Then
        XCTAssertEqual(result.id, expectedID)
        XCTAssertEqual(result.name, expectedName)
        XCTAssertEqual(result.images?.first?.image, expectedFirstImage)
        XCTAssertEqual(result.variations?.first, expectedFirstVariationID)
    }
}
