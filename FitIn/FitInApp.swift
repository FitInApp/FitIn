//
//  FitInApp.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/24/23.
//

import SwiftUI
import ParseSwift

@main
struct FitInApp: App {
    init() {
        ParseSwift.initialize(applicationId: "8EwZi2gg85tPETmWpxnuxwp1jS1CiXFTbXp3N6g3",
                              clientKey: "c1OSWY6rxN9zNMOU0Xtph08if4YgDfZXnlyBM2L2",
                              serverURL: URL(string:"https://parseapi.back4app.com")!)
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

