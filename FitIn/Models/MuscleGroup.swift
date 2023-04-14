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
    let description: String
    let imageName: String
    let exerciseList: [Exercise]
}

extension MuscleGroup {
    static let muscleGroups = [
        "Chest": MuscleGroup(muscleName: "Chest",
                             description: "Take your chest workouts to the next level.",
                             imageName: "chest-model",
        exerciseList: [
                        Exercise.allExercises["Pushups"]!,
                        Exercise.allExercises["Bench Press"]!,
                        Exercise.allExercises["Chest Flyes"]!
                    ]),
        "Back": MuscleGroup(muscleName: "Back",
                    description: "For your lats to your traps and everything in between.",
                    imageName: "back-model",
                    exerciseList: [
                        Exercise.allExercises["Pullups"]!,
                        Exercise.allExercises["Rows"]!,
                        Exercise.allExercises["Lat Pulldowns"]!
                        
                    ]),
        "Arms": MuscleGroup(muscleName: "Arms",
                    description: "From curls to dips to push-ups and more.",
                    imageName: "arms-model",
                    exerciseList: [
                        Exercise.allExercises["Bicep Curls"]!,
                        Exercise.allExercises["Dips"]!,
                        Exercise.allExercises["Tricep Extensions"]!
                        
                    ]),
        "Legs": MuscleGroup(muscleName: "Legs",
                    description: "Strengthen and tone every part of your lower body.",
                    imageName: "legs-model",
                    exerciseList: [
                        Exercise.allExercises["Squats"]!,
                        Exercise.allExercises["Lunges"]!,
                        Exercise.allExercises["Deadlifts"]!
                        
                    ]),
        "Abs": MuscleGroup(muscleName: "Abs",
                    description: "Tone and strengthen your core.",
                    imageName: "abs-model",
                    exerciseList: [
                        Exercise.allExercises["Planks"]!,
                        Exercise.allExercises["Sit-ups"]!,
                        Exercise.allExercises["Crunches"]!
                        
                    ])
        
    ]
}
