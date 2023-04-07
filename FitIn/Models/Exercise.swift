//
//  Exercise.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.

import Foundation
import ParseSwift

struct Exercise : ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    
    var name: String?
    var description: String?
    var image: String?
}

extension Exercise{
    static let allExercises = [
        "Bicep Curls" : Exercise(name: "Bicep Curls",
                                 description: "A bench press is a weight training exercise that involves lifting a barbell or dumbbells while lying on a bench.",
                                 image: "bicepcurls-model"),
        "Squats": Exercise(name: "Squats",
                           description: "Squats are a weight training exercise that involve lifting a barbell or dumbbells while standing and bending the knees to lower the body, then rising back up to a standing position.",
                           image: "squats-model"),
        "Pushups": Exercise(name: "Pushups",
                            description: "Pushups are a bodyweight exercise that involve lowering and raising the body by pushing off the ground with the arms while maintaining a plank-like position.",
                            image: "pushups-model"),
        "Pullups": Exercise(name: "Pullups",
                            description: "Pullups are a bodyweight exercise that involve pulling the body up towards a bar while hanging from it, using the muscles of the back, arms, and shoulders.",
                            image: "pullup-model"),
        "Planks": Exercise(name: "Planks",
                           description: "Planks are a bodyweight exercise that involve holding a straight and rigid position, supporting the body weight on the forearms and toes while maintaining a straight line from head to heels, engaging the core muscles.",
                           image: "planks-model")
        
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
