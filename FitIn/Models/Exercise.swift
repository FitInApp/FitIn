//
//  Exercise.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import Foundation
import ParseSwift

// TODO: Generate exercise data using API and create "Exercise" object that stores data from database.
struct Exercise : ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    var originalData: Data?
    
    var exerciseName: String?
    var muscleGroup: String?
    var imageID: URL?
    var videoID: URL?
}
