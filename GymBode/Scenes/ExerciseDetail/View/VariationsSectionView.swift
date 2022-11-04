//
//  VariationsSectionView.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import SwiftUI

struct VariationsSectionView: View {
    var variations: [Int]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16.0, content: {
                HStack {
                    Text("Variations")
                        .font(.title.bold())
                }
                
                ForEach(variations, id: \.self) { variationID in
                    NavigationLink("Variation \(variationID)") {
                        // Push new variation detail
                        Text("Variation")
                    }
                }
            })
            Spacer()
        }
    }
}

struct VariationsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        VariationsSectionView(variations: [
            228,
            53,
            66,
            241,
            266
        ]).padding()
    }
}
