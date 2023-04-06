//
//  Components.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 3/31/23.
//

import Foundation
import SwiftUI

enum ButtonSize {
    case small
    case medium
    case large
}

enum ButtonHierarchy {
    case primary
    case secondary
}


struct CustomButton: View {
    
    var label:String = ""
    var padding:[CGFloat] = [0,0]
    var cornerRadius:CGFloat = 0
    var backgroundColor:Color = Color(.label)
    var foregroundColor:Color = Color(.systemBackground)
    var fontSize:CGFloat = 12
    
    var body: some View {


        Button(label){}.foregroundColor(foregroundColor)
            .padding([.top, .bottom],padding[0]).padding([.leading,.trailing],padding[1])
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius)).font(.system(size: fontSize))
            
    }
    
    init(labelText: String, size: ButtonSize, type: ButtonHierarchy){
        label = labelText
        
        switch(size) {
            case .small:
                padding = [8,12]
                cornerRadius = 8
                fontSize = 12
                break
            case .medium:
                padding = [12,16]
                cornerRadius = 10
                fontSize = 14
                break
            case .large:
                padding = [14,18]
                cornerRadius = 12
                fontSize = 16
                break
        }
        switch(type) {
            case .primary:
            backgroundColor = Color(.label)
                break
            case .secondary:
                backgroundColor = Color(.secondarySystemBackground)
            foregroundColor = Color(.label)
                break
        }
        
    }
}

struct SmallButtonPrimary_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CustomButton(labelText: "Button", size: ButtonSize.small, type: .primary)
            CustomButton(labelText: "Button", size: ButtonSize.medium, type: .primary)
            CustomButton(labelText: "Button", size: ButtonSize.large, type: .primary)
            CustomButton(labelText: "Button", size: ButtonSize.large, type: .secondary)
        }
    }
}
