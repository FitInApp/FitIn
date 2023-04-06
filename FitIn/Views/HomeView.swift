//
//  HomeView.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import SwiftUI
import ParseSwift
struct HomeView: View {
    @State private var newPost = Post()
    @State private var weight = "100"
    @State private var calories = "2000"
    @Environment(\.colorScheme) var colorScheme
    func addPost() {
        print("Add Post Entry")
        let currentDateTime = Date()
        
        newPost.createObject(user: User.current!, imageID: URL(string:"https://picsum.photos/800")!, date: currentDateTime, weight: weight, calories: calories)
        print(newPost.readObjects()!)
    }
    var body: some View {
        let items: [Post] = newPost.readObjects()!
        VStack{
            Button(action: {addPost()
                
            }) {
                HStack {
                    Text("TEMP Add Post").foregroundColor(.white).padding()
                }
            }.background(Color.black).cornerRadius(30)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(items, id: \.objectId) { item in
                        UserPost(userId: item.user!, text: item.weight!,image: item.imageID!, date: item.createdAt!, weight:item.weight!, calories: item.calories!)
                    }
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
