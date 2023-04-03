//
//  WorkoutData.swift
//  FitIn
//
//  Created by Matias Fuenzalida on 4/3/23.
//

import Foundation

struct WorkoutData{
    
    var workouts: [Workout] = []
    
    
    init(){
        self.workouts = [
            Workout(name: "Bicep Curls", description: "The biceps curl mainly targets the biceps brachii, brachialis and brachioradialis muscles. The biceps is stronger at elbow flexion when the forearm is supinated (palms turned upward) and weaker when the forearm is pronated.[1] The brachioradialis is at its most effective when the palms are facing inward, and the brachialis is unaffected by forearm rotation. Therefore, the degree of forearm rotation affects the degree of muscle recruitment between the three muscles.", bodyPart: .arms, image: "", intensity: 5)
        ]
    }
}
