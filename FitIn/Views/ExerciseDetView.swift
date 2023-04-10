//
//  ExerciseDetView.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import SwiftUI

struct ExerciseDetView: View {

    var exercise: Exercise

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(exercise.image)
                .resizable()
                .scaledToFit()

            Text(exercise.name)
                .fontWeight(.bold)
                .font(.title)

            Text(exercise.description)
                .font(.body)
                .padding(.top)

            Spacer()

            Button(action: {
                // Save the workout to user's saved workouts list
                // Here you would write the code to save the workout to the user's saved workouts list
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle(exercise.name)
    }
}

struct ExerciseDetView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetView(exercise: Exercise.allExercises[]!)
    }
}
