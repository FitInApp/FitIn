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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image("Login-page-splash-image")
                    .resizable()
                    .frame(height: 254)
                    .ignoresSafeArea()
                Spacer()
                
                VStack (alignment: .center, spacing: 35.0){
                    Text("Login".uppercased())
                        .font(.custom("AllertaStencil-Regular", size: 40))
                        .frame(maxWidth: .infinity, alignment: .center)
                    VStack(spacing: 25.0) {
                        TextField("Username", text: $username)
                            .frame(width: 280)
                            .padding()
                            .background(Color(red: 0.9098039215686274, green: 0.9098039215686274, blue: 0.9098039215686274))
                            .cornerRadius(8)
                            .foregroundColor(Color.black)
                            .font(.headline)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            
                        
                        SecureField("Password", text: $password)
                            .frame(width: 280)
                            .padding()
                            .background(Color(red: 0.9098039215686274, green: 0.9098039215686274, blue: 0.9098039215686274))
                            .cornerRadius(8)
                            .foregroundColor(Color.black)
                            .font(.headline)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
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
                                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                .frame(width: 280)
                                .padding()
                                .background(colorScheme == .dark ? Color.white : Color.black)
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
                .frame(width: 280)
                .padding()
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
