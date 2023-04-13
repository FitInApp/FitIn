//
//  StyledStepper.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 4/12/23.
//

import SwiftUI

protocol MyStepperStyle {
    associatedtype Body: View
    func makeBody(_ configuration: MyStepperStyleConfiguration) -> Body
}

struct MyStepperStyleConfiguration {
    var value: Binding<Int>
    var label: Label
    var range: ClosedRange<Int>
    
    struct Label: View {
        var underlyingLabel: AnyView
        
        var body: some View {
            underlyingLabel
        }
    }
}
struct CapsuleStepperStyle: MyStepperStyle {
    func makeBody(_ configuration: MyStepperStyleConfiguration) -> some View {
        CapsuleStepper(configuration: configuration)
    }
}

struct CapsuleStepper: View {
    var configuration: MyStepperStyleConfiguration
    
    @Environment(\.controlSize)
    var controlSize
    
    var padding: Double {
        switch controlSize {
        case .mini: return 4
        case .small: return 6
        default: return 8
        }
    }
    
    var body: some View {
        HStack {
            configuration.label
            Spacer()
            HStack {
                Button("-") { configuration.value.wrappedValue -= 1 }.buttonStyle(.borderedProminent).frame(width: 32, height: 32).cornerRadius(8).tint(.black)
                Text(configuration.value.wrappedValue.formatted())
                Button("+") { configuration.value.wrappedValue += 1 }.buttonStyle(.borderedProminent).frame(width: 32, height: 32).cornerRadius(8).tint(.black)
            }
            .transformEnvironment(\.font, transform: { font in
                if font != nil { return }
                switch controlSize {
                case .mini: font = .footnote
                case .small: font = .callout
                default: font = .body
                }

            })
            .padding(.vertical, padding)
            .padding(.horizontal, padding * 1.5)
            .foregroundColor(.white)
            .background {
                RoundedRectangle(cornerSize:CGSize(width: 12, height: 12))
                    .fill(.thickMaterial)
            }.colorScheme(.dark)
        }
        .buttonStyle(.plain)
    }
}
struct StyledStepper<Label: View, Style: MyStepperStyle>: View {
    @Binding var value: Int
    var `in`: ClosedRange<Int> // todo
    @ViewBuilder var label: Label
    var style: Style
    
    var body: some View {
        style.makeBody(.init(value: $value, label: .init(underlyingLabel: AnyView(label)), range: `in`))
    }
}
struct StyledStepper_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            StyledStepper(value: .constant(10), in: 0...50, label: { Text("No. Reps").font(.title) }, style: CapsuleStepperStyle())
                .controlSize(.regular)
                .font(.body)
            StyledStepper(value: .constant(10), in: 0...50, label: { Text("No. Reps").font(.title) }, style: CapsuleStepperStyle())
                .controlSize(.small)
                .font(.body)
        }.padding(16)
    }
}
