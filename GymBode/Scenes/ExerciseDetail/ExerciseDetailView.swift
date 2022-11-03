//
//  SwiftUIView.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import SwiftUI
import Kingfisher

struct ExerciseDetailView: View {
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
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
                
                HStack {
                    Text("Variations")
                        .font(.title2)
                    Spacer()
                }
                
                LazyVGrid(columns: columns, spacing: 16.0) {
                    // TODO: - Feed Variations
                    ForEach($viewModel.variations,
                            id: \.self) { _ in
                        VStack {
                            SwiftUI.Image(systemName: "figure.gymnastics")
                                .resizable()
                                .frame(width: 50.0, height: 50.0)
                                .font(.largeTitle)
                                .foregroundColor(.purple)
                            Text("Variation Title")
                        }
                        
                    }
                }
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
                                266])
        let viewModel = ExerciseDetailViewModel(with: model)
        
        ExerciseDetailView(viewModel: viewModel)
    }
}
