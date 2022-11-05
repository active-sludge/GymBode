//
//  VariationsSectionView.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import SwiftUI

struct VariationsSectionView: View {
    @ObservedObject var viewModel: VariationsSectionViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16.0, content: {
                HStack {
                    Text("Variations")
                        .font(.title.bold())
                }
                
                ForEach(viewModel.variations, id: \.self) { variationID in
                    NavigationLink("Variation \(variationID)") {
                        ExerciseDetailView(viewModel: .init(id: variationID))
                    }
                }
            })
            Spacer()
        }
    }
}

struct VariationsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = VariationsSectionViewModel(variations: [
            228,
            53,
            66,
            241,
            266
        ])
        VariationsSectionView(viewModel: viewModel).padding()
    }
}
