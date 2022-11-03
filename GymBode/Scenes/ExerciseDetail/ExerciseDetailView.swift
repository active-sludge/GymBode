//
//  SwiftUIView.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import SwiftUI
import Kingfisher

struct ExerciseDetailView: View {
    @StateObject var viewModel: ExerciseDetailViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center,
                   spacing: 32.0) {
                
                ImageSectionView(imageURLs: viewModel.imageURLs)
                
                Text(viewModel.title)
                    .font(.largeTitle.bold())
                
                Capsule()
                    .fill()
                    .frame(height: 8.0)
                
                VariationsSectionView(variations: viewModel.variations)
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
