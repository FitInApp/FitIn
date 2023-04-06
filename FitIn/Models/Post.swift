//
//  Posts.swift
//  FitIn
//
//  Created by Malcolm Verdier on 4/1/23.
//

import Foundation
import ParseSwift
import SwiftUI

struct Post : ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    var originalData: Data?
    
    var user: User?
    var imageID: URL?
    var date: Date?
    var weight: String?
    var calories: String?
}

extension Post {
    func createObject(user: User, imageID: URL, date: Date, weight: String, calories: String) {
        let item = Post(user: user, imageID: imageID, date: date, weight: weight, calories: calories)
        do{
            try item.save()
            print("Success")
        } catch(let error){
            print("Error creating Post", error)
        }
        
    }
    /// Retrieves all the Post objects from your Back4App Database
    func readObjects() -> [Post]? {
        let query = Post.query()
        do{
            
            let items =  try query.find()
           return items
        }catch(let error){
            print("Error querying post", error)
            return nil
        }
    }
    
    /// Updates a Post object on your Back4App Database
    /// - Parameters:
    ///   - objectId: The object id of the ToDoListItem to update
    func updateObject(objectId: String, user: User, imageID: URL, date: Date, weight: String, calories: String) {
        var item = Post(objectId: objectId)
        item.user = user
        item.imageID = imageID
        item.date = date
        item.weight = weight
        item.calories = calories
        
        do{
           try item.save()
        }catch{
            print("Error updating Post")
        }
    }
    
    /// Deletes a Post on your Back4App Database
    /// - Parameter item: The item to be deleted on your Back4App Database
    func deleteObject(item: Post) {
        do{
           try item.delete()
            print("Sucess Deleting objects")
        }catch{
            print("Error deleting Post")
        }
    }
}
