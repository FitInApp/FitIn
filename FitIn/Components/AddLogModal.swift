//
//  AddLogModal.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 4/12/23.
//

import SwiftUI


struct AddLogModal: View {
    @State private var repCount = 10
    @State private var setCount = 3
    @State private var selectedMuscleGroup = "Arms"
    @State private var selectedExercise:String = "Select"
    let muscleGroupNameList = Array(MuscleGroup.muscleGroups.keys).sorted()
  
    
    var body: some View {
        HStack (alignment: .bottom) {
            VStack (alignment: .center) {
                
                Text("Add Workout".uppercased())
                    .font(.custom("AllertaStencil-Regular", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Picker (selection: $selectedMuscleGroup){
                    ForEach(muscleGroupNameList, id: \.self) { muscleGroup in
                        Text(muscleGroup)
                    }
                } label: {
                    
                }.scaleEffect(1.2).pickerStyle(.segmented).scaledToFit().frame(width: 300).tint(.accentColor)
                Spacer().frame(height: 24)
                
                HStack {
                    Text("Exercise").font(.title2)
                    Spacer()
                    Menu{Picker (selection: $selectedExercise){
                        ForEach(
                            MuscleGroup.muscleGroups[selectedMuscleGroup]?.exerciseList.map {
                                (exercise) -> String in
                                return exercise.name ?? "N/A"
                            } ?? ["N/A"]
                            
                            , id: \.self) { exerciseName in
                                Text(exerciseName)
                            }
                    } label: {}
                        
                    }label: {
                        HStack{
                            Text(selectedExercise)
                            Label(selectedExercise, systemImage: "arrow.up.and.down").labelStyle(.iconOnly)
                        }.font(.body).padding(.horizontal, 16).padding(.vertical,10).pickerStyle(.menu).menuStyle(.button).buttonStyle(.plain)
                            .foregroundColor(.white)
                            .tint(.white)
                            .background {
                                RoundedRectangle(cornerSize:CGSize(width: 8, height: 8))
                                    .fill(.thickMaterial)
                            }.colorScheme(.dark)
                    
                    }
                }
                Spacer().frame(height: 24)
                
                StyledStepper(value: $setCount, in: 0...50, label: { Text("No. Sets").font(.title2) }, style: CapsuleStepperStyle())
                    .controlSize(.small)
                    .font(.callout)
                Spacer().frame(height: 20)
                
                StyledStepper(value: $repCount, in: 0...50, label: { Text("No. Reps").font(.title2) }, style: CapsuleStepperStyle())
                    .controlSize(.small)
                    .font(.callout)
            }.padding(.horizontal, 16)
        }
    }
}

struct AddLogModal_Previews: PreviewProvider {
    static var previews: some View {
        AddLogModal()
    }
}
