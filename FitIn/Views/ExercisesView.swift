//
//  ExercisesView.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//
import SwiftUI

struct ExercisesView: View {
    
    let pageName = "Exercises"
    let muscles: [MuscleGroup] = Array(MuscleGroup.muscleGroups.values)

    init(){
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.font : UIFont(name: "AllertaStencil-Regular", size: 30)!]
        navBarAppearance.largeTitleTextAttributes = [.font : UIFont(name: "AllertaStencil-Regular", size: 40)!]
        navBarAppearance.shadowColor = .clear
        
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
       
        
    }
    
    var body: some View {
        VStack{
//            HStack{
//                Text(pageName.uppercased())
//                    .font(.custom("AllertaStencil-Regular", size: 40))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }.padding([.leading,.trailing], 16)
            NavigationView {
                
                List(muscles, id: \.id) { muscle in
                    NavigationLink (destination: ExerciseListView( muscleGroup: muscle)) {
                            
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(muscle.muscleName)
                                    .fontWeight(.semibold)
                                    .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                                Text(muscle.description)
                                    .font(.subheadline)
                                    .lineLimit(2)
                            }
                            Spacer()
                            Image(muscle.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                        }
                    }
                }.navigationBarTitle(pageName.localizedUppercase, displayMode: .large)
            }
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
