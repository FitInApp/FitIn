//
//  ExercisesView.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//
import SwiftUI

struct ExercisesView: View {
    let muscles: [MuscleGroup] = MuscleGroup.muscleGroups
    
    var body: some View {
        NavigationView {
            List(muscles, id: \.id) { muscle in
                // TODO: Navigation Link
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(muscle.muscleName)
                                .fontWeight(.semibold)
                                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            Text(muscle.descriptions)
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                        Spacer()
                        Image(muscle.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                }
            }
        }
        .navigationTitle("Workouts")
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
