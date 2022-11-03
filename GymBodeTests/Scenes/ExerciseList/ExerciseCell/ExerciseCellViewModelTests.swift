//
//  ExerciseCellViewModelTests.swift
//  GymBodeTests
//
//  Created by Can on 3.11.2022.
//

import XCTest
@testable import GymBode

final class ExerciseCellViewModelTests: XCTestCase {
    var sut: ExerciseCellViewModel!
    var model: Exercise!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
    }
    
    override func tearDownWithError() throws {
        model = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func testImageURLIsFirstOneWhenMultipleImageURLStringAreGiven() throws {
        // Given
        model = Exercise(id: 77,
                         name: "Bankdrücken KH",
                         images: [
                            Image(image: "https://wger.de/media/exercise-images/97/Dumbbell-bench-press-1.png"),
                            Image(image: "https://wger.de/media/exercise-images/97/Dumbbell-bench-press-2.png"),
                         ],
                         variations: [
                            77,
                            15,
                            38,
                            17,
                         ])
        
        // When
        sut = .init(with: model)
        
        // Then
        XCTAssertEqual(sut.exerciseImageURL?.absoluteString, model.images?.first?.image)
        XCTAssertNotEqual(sut.exerciseImageURL?.absoluteString, model.images?.last?.image)
    }
    
    func testNameHasDefaultTitleWhenModelDoesNotHave() throws {
        // Given
        model = Exercise(id: nil, name: nil, images: nil, variations: nil)
        let defaultTitle = "No title"
        
        // When
        sut = .init(with: model)
        
        // Then
        XCTAssertEqual(sut.title, defaultTitle)
    }
    
}
