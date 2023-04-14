//
//  AddLogModal.swift
//  FitIn
//
//  Created by Ailany Rodriguez on 4/12/23.
//

import SwiftUI
import PhotosUI
import ParseSwift

struct AddLogModal: View {
    @State private var selectedWeight = 120
    @State private var selectedOption = "Weight"
    @State private var selectedExercise:String = "Select"
    @State private var isPickerShown = false
    @State private var image: UIImage?
    @State private var pickerSourceType: UIImagePickerController.SourceType = .camera
    @State private var showActionSheet = false
    @State private var isCameraShown = false
    @State private var selectedItem: PhotosPickerItem? = nil
    
    @Binding var userWeightLog: [WeightLog] 
    
    @Environment(\.presentationMode) private var presentationMode
    

    
    var body: some View {
        HStack (alignment: .bottom) {
            VStack (alignment: .center, spacing: 16) {
                
                Text("Daily Log".uppercased())
                    .font(.custom("AllertaStencil-Regular", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                VStack(alignment:.leading){
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        Text("No image selected").frame(width: 360, height: 200).background(.quaternary).cornerRadius(12).edgesIgnoringSafeArea(.all)
                    }
                    Text("Weight (lbs)")
                    HStack(alignment: .bottom){
                        TextField("Weight (lbs)", value:$selectedWeight, formatter: NumberFormatter()).textFieldStyle(.roundedBorder).dynamicTypeSize(.xxLarge)
                        Stepper(value: $selectedWeight, in: 0...500) { }
                    }
                }
                
                Divider()
                
                Button(action: {
                    showActionSheet = true
                }) {
                    Label("Upload", systemImage: "photo").frame(maxWidth: .infinity).tint(.blue)
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(title: Text("Select an image"), message: nil, buttons: [
                        .default(Text("Take a photo"), action: {
                            pickerSourceType = .camera
                            isPickerShown = true
                        }),
                        .default(Text("Choose from library"), action: {
                            pickerSourceType = .photoLibrary
                            isPickerShown = true
                        }),
                        .cancel()
                    ])
                }.buttonStyle(.borderedProminent).controlSize(.large).font(.title3).clipShape(RoundedRectangle(cornerRadius: 12)).edgesIgnoringSafeArea(.horizontal).foregroundColor(.black).frame(height: 40).tint(Color(hue: 1.0, saturation: 0.0, brightness: 0.835))

                Button(action: {
                    saveWeightToLog(weight: selectedWeight){result in
                    switch result {
                    case .success(let weightLog):
                        print("Weight log saved successfully: \(weightLog)")
                    
                    case .failure(let error):
                        print("Error saving image: \(error)")
                    }
                }
                   
                   
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Submit").frame(maxWidth: .infinity)
                }).buttonStyle(.borderedProminent).controlSize(.large).font(.title3).tint(Color.primary).edgesIgnoringSafeArea(.horizontal).foregroundColor(.white)
            }.padding(.horizontal, 16)
        }.sheet(isPresented: $isPickerShown) {
            CameraView(isShown: $isPickerShown, image: $image, sourceType: pickerSourceType, onImageSelected: imageSelected)
        }

        .navigationTitle("Camera and Photo Library")
        
    }
    
    
    func saveImageToParse(image: UIImage, completion: @escaping (Result<ImageObject, ParseError>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            completion(.failure(ParseError(code: .unknownError, message: "Failed to convert UIImage to Data.")))
            return
        }

        let imageFile = ParseFile(data: imageData, mimeType: "image/jpeg")

        var imageObject = ImageObject()
        imageObject.imageFile = imageFile
        var user = User.current!
        if (user.progressImages == nil) {
            user.progressImages = []
        }
        imageObject.save { result in
            completion(result)
        }
        user.progressImages?.append(imageObject)
        user.save { result in
            switch result {
            case .success(let updatedUser):
                print("User updated: \(updatedUser)")
            case .failure(let error):
                print("Error updating user: \(error)")
            }
        }
    }
    func imageSelected(_ image: UIImage) {
        saveImageToParse(image: image) { result in
            switch result {
            case .success(let imageObject):
                print("Image saved successfully: \(imageObject)")
            
            case .failure(let error):
                print("Error saving image: \(error)")
            }
        }
    }

    func saveWeightToLog(weight: Int, completion: @escaping (Result<WeightLog, ParseError>) -> Void){
        var user = User.current!
        var weightLog = WeightLog()
        weightLog.weight = weight
        weightLog.createdAt = Date.now
        
        weightLog.save { result in
            completion(result)
        }
        if (User.current!.weightHistory == nil) {
            user.weightHistory = []
        }
        user.weightHistory?.append(weightLog)
        user.save { result in
            switch result {
            case .success(let updatedUser):
                print("User updated: \(updatedUser)")
            case .failure(let error):
                print("Error updating user: \(error)")
            }
        }
    }
}

struct AddLogModal_Previews: PreviewProvider {
    
    static var previews: some View {
        @State  var logTest = [WeightLog()]
        AddLogModal(userWeightLog: $logTest)
    }
}

