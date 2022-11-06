//
//  VariationsSectionViewModel.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import SwiftUI
import Combine

class VariationsSectionViewModel: ObservableObject {
    private (set) var variations: [Int]
    
    init(variations: [Int]) {
        self.variations = variations
    }
}
