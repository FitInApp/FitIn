//
//  ExerciseListView.swift
//  FitIn
//
//  Created by Matias Fuenzalida on 4/6/23.
//

import SwiftUI

struct ExerciseListView: View {
    
    var muscleGroup: MuscleGroup
    
    var body: some View {
        
        NavigationView {
            List(muscleGroup.exerciseList, id: \.name) { exercise in
                NavigationLink(destination: ExerciseDetView(exercise: exercise)) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(exercise.name ?? "")
                                .fontWeight(.semibold)
                                .font(.title2)
                            Text(exercise.description)
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                        Spacer()
                        Image(exercise.image ?? "")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .cornerRadius(20)
                    }
                }
            }
            .navigationBarTitle("Exercises", displayMode: .inline)
        }
        
    }
}
