//
//  LoginView.swift
//  JobHunt
//
//  Created by Ankush Shandil on 05/07/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var isPasswordVisible = false
    
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationStack{
        ScrollView {
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.indigo)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit nsed do eiusmod tempor")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                VStack(spacing: 16) {
                    
                    HStack {
                        Text("Enter Email")
                    }
                    .frame(alignment: .leading)
                    // Email Field
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.4)))
                    
                    // Password Field
                    HStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.4)))
                }
                
                HStack {
                    Toggle(isOn: $rememberMe) {
                        Text("Remember me")
                            .font(.subheadline)
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                    
                    Button(action: {
                        // Forgot password action
                    }) {
                        Text("Forgot Password?")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Button(action: {
                    // Login action
                    navigateToHome = true
                }) {
                    Text("LOGIN")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .navigationDestination(isPresented: $navigateToHome) {
                                HomeScreenView()
                                    .navigationBarBackButtonHidden(true)
                            }
                
                Button(action: {
                    // Google sign-in action
                }) {
                    HStack {
                        Image("icon_Google")
                        Text("SIGN IN WITH GOOGLE")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.purple.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                }
                
                Spacer()
                
                HStack {
                    Text("You don't have an account yet?")
                    Button(action: {
                        // Navigate to Sign Up
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.orange)
                    }
                }
                .font(.footnote)
            }
            .padding()
            .background(Color(UIColor.white))
            .edgesIgnoringSafeArea(.all)
        }
    }
  }
}


#Preview {
    LoginView()
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        }
        .foregroundColor(.gray)
    }
}
