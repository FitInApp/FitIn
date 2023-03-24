//
//  ContentView.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import SwiftUI

let EXERCISE_VIEW_INDEX = 0
let HOME_VIEW_INDEX = 1
let TRACKER_VIEW_INDEX = 2

struct ContentView: View {
    
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
    }
}

