//
//  muscleGroup.swift
//  FitIn
//
//  Created by Edlando Eliacin on 4/1/23.
//

import Foundation

struct MuscleGroup : Identifiable {
    let id = UUID()
    let muscleName: String
    let descriptions: String
    let imageName: String
    let exerciseList: [Exercise]
}

extension MuscleGroup {
    static let muscleGroups = [
        "Chest": MuscleGroup(muscleName: "Chest",
                    descriptions: "Take your chest workouts to the next level.",
                    imageName: "chest-model",
                    exerciseList: [
                        Exercise.allExercises["Pushups"]!
                    ]
                   ),
        "Back": MuscleGroup(muscleName: "Back",
                    descriptions: "For your lats to your traps and everything in between.",
                    imageName: "back-model",
                    exerciseList: [
                        Exercise.allExercises["Pullups"]!
                    ]),
        "Arms": MuscleGroup(muscleName: "Arms",
                    descriptions: "From curls to dips to push-ups and more.",
                    imageName: "arms-model",
                    exerciseList: [
                        Exercise.allExercises["Bicep Curls"]!
                    ]),
        "Legs": MuscleGroup(muscleName: "Legs",
                    descriptions: "Strengthen and tone every part of your lower body.",
                    imageName: "legs-model",
                    exerciseList: [
                        Exercise.allExercises["Squats"]!
                    ]),
        "Abs": MuscleGroup(muscleName: "Abs",
                    descriptions: "Tone and strengthen your core.",
                    imageName: "abs-model",
                    exerciseList: [
                        Exercise.allExercises["Planks"]!
                    ])
        
    ]
}
