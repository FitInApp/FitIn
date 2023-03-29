//
//  LoginView.swift
//  FitIn
//
//  Created by Edlando Eliacin on 3/27/23.
//

import SwiftUI
import ParseSwift

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var path = NavigationPath()
    
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image("Login-page-splash-image")
                    .resizable()
                    .frame(height: 254)
                    .ignoresSafeArea()
                Spacer()
                Text("Login".uppercased())
                    .font(.custom("AllertaStencil-Regular", size: 40))
                    .padding(.trailing, 208)
                Spacer(minLength: 45)
                VStack (spacing: 35.0){
                    VStack(spacing: 25.0) {
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
                            User.login(username: username, password: password) { result in
                                switch result {
                                case .success:
                                    print("✅ Successfully logged in as user: \(username)")
                                    path.append("ContentView")
                                case .failure(let error):
                                    print("❌ LOGIN ERROR: \(error.localizedDescription)")
                                    alertMessage = "LOGIN ERROR: \(error.localizedDescription)"
                                    showingAlert = true
                                }
                            }
                        } label: {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 280)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(8)
                        }
                        HStack {
                            Text("Don't have an account?")
                            Button {
                                path.append("SignupView")
                            } label: {
                                Text("Sign Up")
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
            .navigationDestination(for: String.self) { view in
                if view == "ContentView" {
                    ContentView()
                }
                if view == "SignupView" {
                    SignupView()
                }
            }
        }
        .alert(alertMessage, isPresented: $showingAlert, actions: {
            Button("OK", role: .cancel) {}
        })
        .onAppear {
            if User.current != nil {
                print("✅ Successfully logged in!")
                path.append("ContentView")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
