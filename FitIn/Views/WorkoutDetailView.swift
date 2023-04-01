//
//  WorkoutDetailView.swift
//  FitIn
//
//  Created by [Your Name] on [Date]
//

import SwiftUI
import ParseSwift

struct WorkoutDetailView: View {
    let workout: Workout
    
    var body: some View {
        VStack {
            Text(workout.name)
                .font(.title)
                .padding(.top, 20)
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(.trailing, 20)
            Text("Details about the workout will go here.")
                .padding()
            Spacer()
        }
        .navigationBarTitle("Workout Detail")
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView(workout: Workout(name: "Sample Workout", description: "This is a sample workout"))
    }
}

