//
//  SwiftUIView.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import SwiftUI
import Kingfisher

struct ExerciseDetailView: View {
    private let rows = [GridItem(.fixed(150))]
    
    @StateObject var viewModel: ExerciseDetailViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center,
                   spacing: 32.0) {
                
                if viewModel.imageURLs.isEmpty {
                    SwiftUI.Image(systemName: "figure.gymnastics")
                        .resizable()
                        .frame(width: 250.0, height: 250.0)
                        .font(.largeTitle)
                        .foregroundColor(.purple)
                } else {
                    ScrollView(.horizontal,
                               showsIndicators: false) {
                        LazyHGrid(rows: rows, spacing: 16.0) {
                            ForEach(viewModel.imageURLs.indices,
                                    id: \.self) { index in
                                KFImage.url(URL(string: viewModel.imageURLs[index]))
                                    .resizable()
                                    .frame(width: 250.0,
                                           height: 250.0)
                            }
                        }
                    }.padding()
                }
                
                Text(viewModel.title)
                    .font(.largeTitle.bold())
                
                Capsule()
                    .fill()
                    .frame(height: 8.0)
                
                VStack(alignment: .trailing, spacing: 16.0, content: {
                    HStack {
                        Text("Variations")
                            .font(.title.bold())
                    }
                    
                    ForEach(viewModel.variations, id: \.self) { variationID in
                        Text("Variation \(variationID)")
                    }
                })
            }
        }.padding()
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Exercise(id: 345,
                             name: "Bankdrücken Eng",
                             images: [
                                .init(image: "https://wger.de/media/exercise-images/88/Narrow-grip-bench-press-1.png"),
                                .init(image: "https://wger.de/media/exercise-images/88/Narrow-grip-bench-press-2.png")
                             ],
                             variations: [
                                228,
                                53,
                                66,
                                241,
                                266
                             ])
        let viewModel = ExerciseDetailViewModel(with: model)
        
        ExerciseDetailView(viewModel: viewModel)
    }
}
