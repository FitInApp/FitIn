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
