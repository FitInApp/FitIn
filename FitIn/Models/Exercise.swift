//
//  Exercise.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.

import Foundation

struct Exercise : Identifiable{
    let id = UUID()
    let name: String
    let description: String
    let image: String
}

extension Exercise{
    static let allExercises = [
        
        //
        //Arms Workout
        //
        "Bicep Curls" : Exercise(name: "Bicep Curls",
                                 description: "Bicep curls are an isolation exercise that target the biceps, and involve lifting a weight with your arms while keeping your elbows close to your body.",
                                 image: "bicepcurls-model"),
        "Dips" : Exercise(name: "Dips",
                          description: "Dips are a compound exercise that primarily target the triceps, chest, and shoulders, and involve lowering and raising your body by bending and extending your arms.",
                          image: "dips-model"),
        "Tricep Extensions" : Exercise(name: "Tricep Extensions",
                                       description: "Tricep extensions are an isolation exercise that target the triceps, and involve extending your arms with a weight while keeping your elbows close to your head.",
                                       image: "tricep-extension-model"),

        //
        // LEGS
        //
        "Squats": Exercise(name: "Squats",
                           description: "Squats are a weight training exercise that involve lifting a barbell or dumbbells while standing and bending the knees to lower the body, then rising back up to a standing position.",
                           image: "squats-model"),
        "Lunges": Exercise(name: "Lunges",
                           description: "Lunges are a unilateral exercise that primarily target the legs and glutes, and involve stepping forward or backward and bending your knees to lower your body.",
                           image: "lunges-model"),
        "Deadlifts": Exercise(name: "Deadlifts",
                              description: "Deadlifts are a compound exercise that primarily target the back, glutes, and legs, and involve lifting a barbell or dumbbell from the ground to a standing position.",
                              image: "deadlift-model"),

        //
        // CHEST
        //
        "Pushups": Exercise(name: "Pushups",
                            description: "Pushups are a bodyweight exercise that involve lowering and raising the body by pushing off the ground with the arms while maintaining a plank-like position.",
                            image: "pushups-model"),
        "Bench Press" : Exercise(name: "Bench Press",
                                 description: "Bench press is a weight training exercise that involves lifting a barbell or dumbbells while lying on a bench, targeting the chest and triceps.",
                                 image: "benchpress-model"),
        "Chest Flyes" : Exercise(name: "Chest Flyes",
                                 description: "Chest flyes are an isolation exercise that primarily target the chest muscles, and involve lying on a bench with a weight in each hand and extending your arms out to the sides.",
                                 image: "chest-flyes-model"),

        //
        // BACK
        //
        "Pullups": Exercise(name: "Pullups",
                            description: "Pullups are a bodyweight exercise that involve pulling the body up towards a bar while hanging from it, using the muscles of the back, arms, and shoulders.",
                            image: "pullup-model"),
        "Rows" : Exercise(name: "Rows",
                           description: "Rows are a compound exercise that target the back and arms, and involve pulling a weight towards your body while keeping your elbows close to your sides.",
                           image: "rows-model"),
        "Lat Pulldowns" : Exercise(name: "Lat Pulldowns",
                                   description: "Lat pulldowns are an isolation exercise that primarily target the lats and biceps, and involve pulling a weight down towards your chest while sitting on a machine.",
                                   image: "lat-pulldown-model"),

        
        //ABS
        "Planks": Exercise(name: "Planks",
                           description: "Planks are a bodyweight exercise that involve holding a straight and rigid position, supporting the body weight on the forearms and toes while maintaining a straight line from head to heels, engaging the core muscles.",
                           image: "planks-model"),
        
        "Sit-ups": Exercise(name: "Sit-ups",
                            description: "Sit-ups are a classic exercise that primarily target the abs, and involve lying on your back, bending your knees, and lifting your upper body to your knees.",
                            image: "sit-ups-model"),
        
        "Crunches": Exercise(name: "Crunches",
                             description: "Crunches are a classic exercise that primarily target the abs, and involve lying on your back with your knees bent, then lifting your head, neck, and shoulders towards your knees.",
                             image: "crunches-model"),
                             
        "Russian Twists": Exercise(name: "Russian Twists",
                                   description: "Russian twists are a core exercise that primarily target the obliques, and involve sitting on the floor with your knees bent, then twisting your torso side to side while holding a weight or medicine ball.",
                                   image: "russian-twist-model")

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
