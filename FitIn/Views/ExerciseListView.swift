//
//  ExerciseListView.swift
//  FitIn
//
//  Created by Matias Fuenzalida on 4/6/23.
//

import SwiftUI

struct ExerciseListView: View {
    
    var muscleGroup: MuscleGroup
    
    var body: some View{
        NavigationView{
            List(muscleGroup.exerciseList, id: \.name){exercise in
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(exercise.name)
                            .fontWeight(.semibold)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        Text(exercise.description)
                            .font(.subheadline)
                            .lineLimit(2)
                    }
                    Spacer()
                    Image(exercise.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                }
            }
        }
        
    }
}

