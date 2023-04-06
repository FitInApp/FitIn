//
//  TrackerView.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import SwiftUI

struct TrackerView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
        VStack {
            HStack{
                Text("Progress".uppercased())
                    .font(.custom("AllertaStencil-Regular", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button("+ Add"){
                    onAddButtonTapped()
                }
                .font(.subheadline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .foregroundColor(Color(.systemBackground))
                        .background(Color(.label))
                        .cornerRadius(8)
            }.padding([.leading,.trailing], 16)
            
            Spacer()
        }
        
    }
    
    
    func onAddButtonTapped () {
        //
    }
    func addWorkout () {
        //TODO: implement add workout using Exercise object and add to a new object that holds historical information
    }
}

struct AddWorkoutView: View {
    var body: some View{
        VStack{
            
        }
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
