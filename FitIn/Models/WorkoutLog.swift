//
//  WorkoutLog.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/31/23.
//
import Foundation
import ParseSwift

struct WorkoutLog : ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    
    var exercise:Exercise?
    var personWeight:Float?
    var repCount:Int?
    var setCount:Int?
}
