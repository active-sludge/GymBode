//
//  ImageSectionView.swift
//  GymBode
//
//  Created by Can on 4.11.2022.
//

import SwiftUI
import Kingfisher

struct ImageSectionView: View {
    var imageURLs: [String]
    private let rows = [GridItem(.fixed(150))]
    
    var body: some View {
        Group {
            if imageURLs.isEmpty {
                SwiftUI.Image(systemName: "figure.gymnastics")
                    .resizable()
                    .frame(width: 250.0, height: 250.0)
                    .font(.largeTitle)
                    .foregroundColor(.purple)
            } else {
                ScrollView(.horizontal,
                           showsIndicators: false) {
                    LazyHGrid(rows: rows, spacing: 16.0) {
                        ForEach(imageURLs.indices,
                                id: \.self) { index in
                            KFImage.url(URL(string: imageURLs[index]))
                                .resizable()
                                .frame(width: 250.0,
                                       height: 250.0)
                        }
                    }
                }.padding()
            }
        }
    }
}


struct ImageSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSectionView(imageURLs: [
            "https://wger.de/media/exercise-images/88/Narrow-grip-bench-press-1.png",
            "https://wger.de/media/exercise-images/88/Narrow-grip-bench-press-2.png"
         ])
    }
}
