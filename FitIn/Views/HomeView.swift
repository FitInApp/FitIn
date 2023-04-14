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
    @State private var showingAddPostModal = false
    func addPost() {
        print("Add Post Entry")
        let currentDateTime = Date()
        
        newPost.createObject(user: User.current!, imageID: URL(string:"https://picsum.photos/800")!, date: currentDateTime, weight: weight, calories: calories)
        print(newPost.readObjects()!)
    }
    var body: some View {
        let items: [Post] = newPost.readObjects() ?? []
        VStack{
            Button(action: {addPost()
                
            }) {
                HStack{
                    Text("FITIN") //TODO: Replace with Logo
                        .font(.custom("AllertaStencil-Regular", size: 40))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Button("+ Post"){
                        showingAddPostModal.toggle()
                    }.sheet(isPresented: $showingAddPostModal) {
                        AddPostModal().foregroundColor(.black).presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                    }
                    .font(.subheadline)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .foregroundColor(Color(.systemBackground))
                            .background(Color(.label))
                            .cornerRadius(8)
                }.padding([.leading,.trailing], 16)
                
            }
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(items, id: \.objectId) { item in
                        PostCard(userId: item.user!, text: item.weight!,image: item.imageID!, date: item.createdAt!, weight:item.weight!, calories: item.calories!)
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
