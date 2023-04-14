//
//  ExerciseDetView.swift
//  FitIn
//
//  Created by Matias Fuenzalida on 4/6/23.
//

import SwiftUI

struct ExerciseDetView: View {
    var exercise: Exercise

    @Environment(\.presentationMode) var presentationMode


    func saveWorkout() {
        print("Workout saved")
    }

    var body: some View {
        VStack {
            Image(exercise.image ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding(.top, 50)

            Text(exercise.name ?? "")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text(exercise.description)
                .font(.body)
                .padding(.top, 20)
                .padding(.horizontal, 20)

            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Workouts")
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: saveWorkout) {
                    Image(systemName: "square.and.arrow.down")
                        .font(.title)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
