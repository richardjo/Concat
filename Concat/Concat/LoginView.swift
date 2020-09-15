//
//  LoginView.swift
//  Concat
//
//  Created by Richard Jo on 9/14/20.
//  Copyright © 2020 Richard Jo. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isTyping = false
    @State var isCreateAccount = false
    @State var isSubmitted = false
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .center){
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.leading, 23)
                Text("The first social media platform to meet students - easily, seamlessly, and intentionally.")
                    .font(.subheadline)
                    .padding(.top, 23)
                    .foregroundColor(Color.white)
            }
            .padding(.top, 90)
            .frame(maxWidth: .infinity)
            .frame(height: screen.height / 2)
            .background(Color(#colorLiteral(red: 0.3450980392, green: 0.1725490196, blue: 0.5137254902, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
            .edgesIgnoringSafeArea(.top)
            .multilineTextAlignment(.center)
            
            
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "person")
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 20)
                            .padding(.trailing, 13)
                        Spacer()
                        TextField("Email", text: $email)
                            .onTapGesture {
                                self.isTyping = true
                        }
                    }
                    Divider()
                    HStack {
                        Image(systemName: "lock")
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 20)
                            .padding(.trailing, 13)
                        Spacer()
                        SecureField("Password", text: $password)
                            .onTapGesture {
                                self.isTyping = true
                        }
                    }
                }
                .frame(width: screen.width - 70, height: 150)
                .padding(.horizontal, 17)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
                .shadow(radius: 13)
            }
            .frame(height: screen.height)
            
            VStack {
                Text("Sign In")
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(Color.white)
                .frame(width: screen.width - 60, height: 50)
                .background(Color(#colorLiteral(red: 0.3450980392, green: 0.1725490196, blue: 0.5137254902, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                .padding(.bottom, 17)
                
                Button(action: {
                    self.isCreateAccount = true
                }) {
                    Text("Create an account")
                    .foregroundColor(Color(#colorLiteral(red: 0.3450980392, green: 0.1725490196, blue: 0.5137254902, alpha: 1)))
                }.sheet(isPresented: $isCreateAccount) {
                    FormView()
                }
            }
            .offset(y: screen.height * 0.65)
            
            
        }
        .onTapGesture {
            self.isTyping = false
            dismissKeyboard()
        }
        .offset(y: isTyping ? -130 : 0)
        .animation(Animation.easeInOut(duration: 0.3))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

func dismissKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
