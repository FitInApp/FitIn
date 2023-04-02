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
        
        newPost.createObject(user: User.current!, imageID: URL(string:"https://www.google.com/url?sa=i&url=https%3A%2F%2Fpicsum.photos%2F&psig=AOvVaw0r0JFlxQy2lhU9rRAUhHrS&ust=1680486652876000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCJCwquGKiv4CFQAAAAAdAAAAABAE")!, date: currentDateTime, weight: weight, calories: calories)
    }
    var body: some View {
        let items: [Post] = newPost.readObjects()!
        VStack{
            Button(action: {addPost()
                
            }) {
                HStack {
                    Text("Add Post").foregroundColor(.white).padding()
                }
            }.background(Color.black).cornerRadius(30)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(items, id: \.objectId) { item in

                        Text(item.weight!)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 300, height: 200)
                            .background(.red)
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
