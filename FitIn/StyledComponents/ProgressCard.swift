//
//  ProgressCard.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/31/23.
//

import Foundation
import SwiftUI
import ParseSwift
import Nuke

struct ProgressCard: View {
    
   
    var date:String = ""
    var body: some View {

        VStack{
            //TODO: Implement Card component to display workout history
            Text(date)
        }
            
    }
    
    init(dateStr: String){
        date = dateStr
    }
}

struct SmallButtonPrimary_Previews: PreviewProvider {

    static var previews: some View {
        ProgressCard(dateStr: "YYYY-MM-DD")
    }
}
