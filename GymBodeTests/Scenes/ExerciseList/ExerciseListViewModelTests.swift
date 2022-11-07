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

    func testExample() throws {
        //Given
        let expectedArrayCount = 20
        let expectedFirstExerciseID = 345
        
        // When
        sut.fetchExerciseList()
        
        //Then
        XCTAssertEqual(sut.exercises.count, expectedArrayCount)
        XCTAssertEqual(sut.exercises.first?.id, expectedFirstExerciseID)
    }
    
    func testInitialStateIsIdleBeforeFetchStarted() throws {
        // Given
        let expectedState: ExerciseListViewModel.ExerciseListViewModelStates = .idle
    
        // When
        sut.fetchExerciseList()
        
        // Then
        XCTAssertEqual(sut.state, expectedState)
    }
    
    func stateChangesFromIdleToLoadingWhenFetchStarted() throws {
        // Given
        let expectedState: ExerciseListViewModel.ExerciseListViewModelStates = .loading
        let initialState: ExerciseListViewModel.ExerciseListViewModelStates = .idle
        let finalState: ExerciseListViewModel.ExerciseListViewModelStates = .finishedLoading
        
        // When
        sut.fetchExerciseList()
        
        // Then
        XCTAssertEqual(sut.state, expectedState)
        XCTAssertEqual(sut.state, initialState)
        XCTAssertEqual(sut.state, finalState)
        
    }

}
