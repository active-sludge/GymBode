//
//  SwiftUIView.swift
//  GymBode
//
//  Created by Can on 2.11.2022.
//

import SwiftUI

struct ExerciseDetailView: View {
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    //TODO: - Feed viewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center,
                   spacing: 32.0) {
                SwiftUI.Image(systemName: "figure.gymnastics")
                    .resizable()
                    .frame(width: 150.0, height: 150.0)
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                Text("2 Handed me Kettlebell Swing")
                    .font(.title)
                
                LazyVGrid(columns: columns, spacing: 16.0) {
                    // TODO: - Feed Variations
                    Text("2 Handed me Kettlebell Swing")
                    Text("2 Handed me Kettlebell Swing")
                    Text("2 Handed me Kettlebell Swing")
                    Text("2 Handed me Kettlebell Swing")
                    Text("2 Handed me Kettlebell Swing")
                    Text("2 Handed me Kettlebell Swing")
                    Text("2 Handed me Kettlebell Swing")
                }
            }
        }.padding()
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView()
    }
}
