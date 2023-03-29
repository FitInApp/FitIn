//
//  SignupView.swift
//  FitIn
//
//  Created by Edlando Eliacin on 3/28/23.
//

import SwiftUI
import ParseSwift

struct SignupView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var path = NavigationPath()
    
    
    var body: some View {
            VStack {
                Image("Signup-page-splash-image")
                    .resizable()
                    .frame(height: 254)
                    .ignoresSafeArea()
                Spacer()
                Text("Sign up".uppercased())
                    .font(.custom("AllertaStencil-Regular", size: 40))
                    .padding(.trailing, 180)
                Spacer(minLength: 45)
                VStack (spacing: 49.0) {
                    VStack(spacing: 25.0) {
                        TextField("Email", text: $email)
                            .frame(width: 280)
                            .padding()
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9098039215686274, green: 0.9098039215686274, blue: 0.9098039215686274)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(8)
                            .foregroundColor(Color.black)
                            .font(.headline)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(/*@START_MENU_TOKEN@*/.never/*@END_MENU_TOKEN@*/)
                        TextField("Username", text: $username)
                            .frame(width: 280)
                            .padding()
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9098039215686274, green: 0.9098039215686274, blue: 0.9098039215686274)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(8)
                            .foregroundColor(Color.black)
                            .font(.headline)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(/*@START_MENU_TOKEN@*/.never/*@END_MENU_TOKEN@*/)
                        SecureField("Password", text: $password)
                            .frame(width: 280)
                            .padding()
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.9098039215686274, green: 0.9098039215686274, blue: 0.9098039215686274)/*@END_MENU_TOKEN@*/)
                            .cornerRadius(8)
                            .foregroundColor(Color.black)
                            .font(.headline)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(/*@START_MENU_TOKEN@*/.never/*@END_MENU_TOKEN@*/)
                    }
                    VStack {
                        Button {
                            var newUser = User()
                            newUser.email = email
                            newUser.username = username
                            newUser.password = password
                            
                            newUser.signup { result in
                                switch result {
                                case .success(let user):
                                    print("✅ Successfully sign up user \(user)")
                                    dismiss()
                                case .failure(let error):
                                    print("❌ SIGN-UP ERROR: \(error.localizedDescription)")
                                    alertMessage = "LOGIN ERROR: \(error.localizedDescription)"
                                    showingAlert = true
                                }
                            }
                        } label: {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 280)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(8)
                        }
                        HStack {
                            Text("Have an account?")
                            Button {
                                dismiss()
                            } label: {
                                Text("Log in")
                                    .font(.headline)
                                    .foregroundColor(Color.blue)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.trailing, 25)
                Spacer()
            }
            .navigationBarBackButtonHidden()
            .alert(alertMessage, isPresented: $showingAlert, actions: {
                Button("OK", role: .cancel) {}
            })
        }
        
    }

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
