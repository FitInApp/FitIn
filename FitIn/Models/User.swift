//
//  User.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import Foundation
import ParseSwift

struct User: ParseUser {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    
    var username: String?
    var password: String?
    var email: String?
    var emailVerified: Bool?
    var authData: [String : [String : String]?]?
    var posts: [Post]?
    var workoutLog: [WorkoutLog]?
}
