//
//  ContentView.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import SwiftUI
import ParseSwift
let EXERCISE_VIEW_INDEX = 0
let HOME_VIEW_INDEX = 1
let TRACKER_VIEW_INDEX = 2

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab = HOME_VIEW_INDEX
    
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab) {
                    ExercisesView()
                        .tabItem {
                            Image( "WeightLifterIcon")
                                .renderingMode(.template)
                        }
                        .tag(EXERCISE_VIEW_INDEX)
                    HomeView()
                        .tabItem {
                            Image( "FireIcon")
                                .renderingMode(.template)
                        }
                        .tag(HOME_VIEW_INDEX)
                    TrackerView()
                        .tabItem {
                            Image("ChartIcon")
                                .renderingMode(.template)
                        }
                        .tag(TRACKER_VIEW_INDEX)
                }.accentColor(Color.black)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                // TODO: Place logo on left side of navbar
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Log Out") {
                    User.logout() { result in
                        switch result {
                        case .success:
                            print("✅ Logout Successful")
                            dismiss()
                        case .failure(let error):
                            print("❌ LOGOUT ERROR: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
}

