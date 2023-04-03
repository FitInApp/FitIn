//
//  Workouts.swift
//  FitIn
//
//  Created by Matias Fuenzalida on 4/3/23.
//

import Foundation
import ParseSwift

struct Workout {
    var name: String
    var description: String
    var bodyPart: BodyPart
    var image: String
    var intensity: Int
}

enum BodyPart {
    case arms
    case legs
    case chest
    case back
    case abs
}


//ARM WORKOUTS
let BicepCurls = Workout(name: "Bicep Curls", description: "The biceps curl mainly targets the biceps brachii, brachialis and brachioradialis muscles. The biceps is stronger at elbow flexion when the forearm is supinated (palms turned upward) and weaker when the forearm is pronated.[1] The brachioradialis is at its most effective when the palms are facing inward, and the brachialis is unaffected by forearm rotation. Therefore, the degree of forearm rotation affects the degree of muscle recruitment between the three muscles.", bodyPart: .arms, image: "", intensity: 5)

//LEG WORKOUTS
let Squats = Workout(name: "Squats", description: "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up. During the descent, the hip and knee joints flex while the ankle joint dorsiflexes; conversely the hip and knee joints extend and the ankle joint plantarflexes when standing up. Squats also help your hip muscles", bodyPart: .legs, image: <#T##String#>, intensity: 7)

//CHEST WORKOUT
let Pushups = Workout(name: "Pushups", description: "To do pushups with correct form, start in a plank position with your hands slightly wider than your shoulders. Lower your body until your chest touches the ground, keeping your back and legs in a straight line. Push yourself back up to the starting position by fully extending your arms. Keep your core engaged throughout the exercise and maintain a neutral neck and spine alignment.", bodyPart: .chest, image: <#T##String#>, intensity: 6)

//BACK WORKOUT
let Pullups = Workout(name: "Pullups", description: "Pullups involve grasping a pullup bar with an overhand grip, pulling your body up until your chin is over the bar, and then lowering yourself back down with control while keeping your core engaged and shoulders pulled down and back.", bodyPart: .back, image: <#T##String#>, intensity: 10)


//ABS WORKOUT
let Planks = Workout(name: "Planks", description: "Holding your body (light as a feather) stiff as a board develops strength primarily in your core — the muscles that connect your upper body and lower body — as well as your shoulders, arms, and glutes.", bodyPart: .abs, image: <#T##String#>, intensity: 10)


//Sure, here are three bodyweight exercises for each category:
//
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
