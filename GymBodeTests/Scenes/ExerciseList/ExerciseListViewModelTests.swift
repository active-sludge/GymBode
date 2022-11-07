//
//  ExerciseListViewModelTests.swift
//  GymBodeTests
//
//  Created by Can on 3.11.2022.
//

import XCTest
import Combine
@testable import GymBode

final class ExerciseListViewModelTests: XCTestCase {
    private var sut: ExerciseListViewModel!
    private var bindings = Set<AnyCancellable>()

    override func setUpWithError() throws {
        sut = ExerciseListViewModel(service: MockExerciseService())
    }

    override func tearDownWithError() throws {
        sut = nil
        bindings = []
    }

    func testFetchExerciseListAssignsExerciseList() throws {
        //Given
        let expectedArrayCount = 20
        let expectedFirstExerciseID = 345
        let expectation = expectation(description: "Wait for exercise response to return.")
        
        // When
        sut.fetchExerciseList()
        expectation.fulfill()
        
        //Then
        waitForExpectations(timeout: 1.5)
        XCTAssertEqual(sut.exercises.count, expectedArrayCount)
        XCTAssertEqual(sut.exercises.first?.id, expectedFirstExerciseID)
    }
    
    func testStateChangesFromIdleToLoadingWhenFetchStarted() throws {
        // Given
        let initialState: ExerciseListViewModel.ExerciseListViewModelStates = .idle
        let expectedState: ExerciseListViewModel.ExerciseListViewModelStates = .loading
        
        let loadingExpectation = expectation(description: "Wait for state to change to loading.")
        
        XCTAssertEqual(sut.state, initialState)
        
        // When
        sut.fetchExerciseList()
        loadingExpectation.fulfill()
        
        // Then
        waitForExpectations(timeout: 0.5, handler: nil)
        XCTAssertEqual(sut.state, expectedState)
    }
    
    func testStateChangesFromLoadingToFinishedLoadingWhenFetchFinished() throws {
        // Given
        let initialState: ExerciseListViewModel.ExerciseListViewModelStates = .loading
        let expectedState: ExerciseListViewModel.ExerciseListViewModelStates = .finishedLoading
        
        let finishedLoadingExpectation = expectation(description: "Wait for state to change to finishedLoading.")
        
        // When
        sut.fetchExerciseList()
        XCTAssertEqual(sut.state, initialState)
        finishedLoadingExpectation.fulfill()
        
        // Then
        waitForExpectations(timeout: 1.5, handler: nil)
        XCTAssertEqual(sut.state, expectedState)
    }

}
