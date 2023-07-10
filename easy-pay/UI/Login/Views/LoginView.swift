//
//  LoginView.swift
//  easy-pay
//
//  Created by Mohit Kumar Singh on 10/07/23.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Propertiers
    @State var securePassword: Bool = true
    
    @ObservedObject var viewModel = LoginViewModel()
    
    @State var phoneErrorText: String = ""
    @State var passwordErrorText: String = ""
    
    // MARK: - View
    var body: some View {
        VStack() {
            Text("Welcome to easy-pay")
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 40)
                .shadow(radius: 10.0, x: 20, y: 10)
            
            Image("iosapptemplate")
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10.0, x: 20, y: 10)
                .padding(.bottom, 50)
            
            VStack(alignment: .leading, spacing: 30) {
                VStack {
                    HStack {
                        
                        VStack {
                            
                            Button {
                                // Need to add json for telephone code before providing access to this button
                            } label: {
                                HStack {
                                    Text(self.viewModel.getFlag())
                                    Text("+91")
                                        .foregroundColor(.black)
                                }
                            }

                            
                        }.frame(width: 80, height: 54)
                            .background(Color.themeTextField)
                            .cornerRadius(20)
                            .shadow(radius: 10.0, x: 20, y: 10)
                        TextField("Phone", text: self.$viewModel.phone)
                            .padding()
                            .background(Color.themeTextField)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                            .textContentType(.telephoneNumber)
                        .keyboardType(.phonePad)
                    }
                    HStack {
                        Text(phoneErrorText).padding(.leading, 105)
                            .font(.caption).fontWeight(.bold)
                            .foregroundColor(.red)
                        Spacer()
                    }
                }
                
                VStack {
                    ZStack {
                        
                        if securePassword {
                            SecureField("Password", text: self.$viewModel.password)
                                .padding()
                                .background(Color.themeTextField)
                                .cornerRadius(20.0)
                                .shadow(radius: 10.0, x: 20, y: 10)
                                .textContentType(.password)
                            .keyboardType(.emailAddress)
                        } else {
                            TextField("Password", text: self.$viewModel.password)
                                .padding()
                                .background(Color.themeTextField)
                                .cornerRadius(20.0)
                                .shadow(radius: 10.0, x: 20, y: 10)
                                .textContentType(.password)
                            .keyboardType(.emailAddress)
                        }
                        
                        HStack {
                            
                            Spacer()
                            
                            Button {
                                self.securePassword.toggle()
                            } label: {
                                HStack {
                                    Image(systemName: securePassword ? "eye" : "eye.slash")
                                        .resizable()
                                        .frame(width: 26, height: 18)
                                        .padding(15)
                                    .foregroundColor(.black)
                                }
                            }
                        }
                        
                    }
                    .frame(height: 46)
                    HStack {
                        Text(passwordErrorText).padding(.leading, 25)
                            .font(.caption).fontWeight(.bold)
                            .foregroundColor(.red)
                        Spacer()
                    }
                }
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {}) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 50)
            
            Spacer()
            HStack(spacing: 0) {
                Text("Don't have an account? ")
                Button(action: {}) {
                    Text("Sign Up")
                        .foregroundColor(.black)
                }
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
        .onChange(of: self.viewModel.phone) { newValue in
            self.phoneErrorText = newValue.isValidPhone
            ? ""
            : "Invalid phone"
        }
        .onChange(of: self.viewModel.password) { newValue in
            self.passwordErrorText = newValue.isValidPassword
            ? ""
            : "Password should be more than 5 characters long"
        }
        .onAppear {
            self.viewModel.getCountryCodes()
        }
        
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
