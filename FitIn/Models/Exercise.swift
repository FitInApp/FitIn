//
//  Exercise.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.

import Foundation

public struct Exercise {
    
    var exerciseName: String
    var exerciseDescription: String?
    var muscleGroup: MuscleGroup?
    var imageID: URL?
    var videoID: URL?
    var intensity: Int?
}

extension Exercise{
    static let allExercises = [
        Exercise(exerciseName: "Bicep Curls"),
        Exercise(exerciseName: "Squats"),
        Exercise(exerciseName: "Pushups"),
        Exercise(exerciseName: "Pullups"),
        Exercise(exerciseName: "Planks")
        
    ]
}


    //Arms:
    //
    //Push-ups: a classic exercise that targets the chest, shoulders, and triceps.
    //Dips: an exercise that targets the triceps and chest, using a chair or parallel bars.
    //Diamond push-ups: a variation of push-ups that targets the triceps more specifically.
    //Legs:
    //
    //Squats: an exercise that targets the quads, glutes, and hamstrings.
    //Lunges: an exercise that targets the quads, glutes, and hamstrings, as well as the core.
    //Calf raises: an exercise that targets the calf muscles, by raising your heels off the ground and back down.
    //Chest:
    //
    //Push-ups: a classic exercise that targets the chest, shoulders, and triceps.
    //Chest dips: an exercise that targets the chest and triceps, using parallel bars.
    //Plyometric push-ups: a more advanced variation of push-ups that involves explosive movements to increase power and strength in the chest.
    //Back:
    //
    //Pull-ups: an exercise that targets the upper back and biceps, using a pull-up bar.
    //Bodyweight rows: an exercise that targets the upper back and biceps, using a sturdy object to pull towards.
    //Superman: an exercise that targets the lower back muscles, by lying face down and lifting your arms and legs off the ground.
    //Abs:
    //
    //Plank: an exercise that targets the core muscles, by holding a straight line from head to heels.
    //Bicycle crunches: an exercise that targets the abs and obliques, by lying on your back and bringing your knees towards your chest, while alternating elbow to knee touches.
    //Leg raises: an exercise that targets the lower abs, by lying on your back and lifting your legs straight up towards the ceiling.
