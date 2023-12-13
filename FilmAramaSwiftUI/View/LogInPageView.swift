//
//  LogInPageView.swift
//  FilmAramaSwiftUI
//
//  Created by Oğuzhan on 16.10.2023.
//

import SwiftUI

struct LogInPageView: View {
    @State private var email = ""
     @State private var password = ""
     
     
     var body: some View {
         NavigationView {
             VStack() {
                 Text("")
                     .font(.largeTitle).foregroundColor(Color.white)
                     .padding([.top, .bottom], 40)
                     .shadow(radius: 10.0, x: 20, y: 10)
                 
                 Image("redmoon")
                     .resizable()
                     .frame(width: 250, height: 250)
                     .clipShape(Circle())
                     .overlay(Circle().stroke(Gradient(colors: [.white,.black,.black])))
                     .shadow(radius: 10.0, x: 20, y: 10)
                     .padding(.bottom, 50)
                 
                 VStack(alignment: .leading, spacing: 15) {
                     TextField("Email", text: self.$email)
                         .padding()
                         .background(RadialGradient(gradient: Gradient(colors: [.white,.accentColor ]), center: .center, startRadius: 2, endRadius: 650))
                         .cornerRadius(20.0)
                         .shadow(radius: 10.0, x: 20, y: 10)
                     
                     
                     SecureField("Password", text: self.$password)
                         .padding()
                         .background(RadialGradient(gradient: Gradient(colors: [.white,.accentColor ]), center: .center, startRadius: 2, endRadius: 650))
                         .cornerRadius(20.0)
                         .shadow(radius: 10.0, x: 20, y: 10)
                 }.padding([.leading, .trailing], 27.5)
                 
                 NavigationLink(destination: TabGorunum()) {
                     Text("Sign In")
                         .font(.headline)
                         .foregroundColor(.white)
                         .padding()
                         .frame(width: 300, height: 50)
                         .background( RadialGradient(gradient: Gradient(colors: [.pink,.black, .white]), center: .center, startRadius: 2, endRadius: 650))
                         .cornerRadius(15.0)
                         .shadow(radius: 10.0, x: 20, y: 10)
                 }.padding(.top, 50) 
                 
                 Spacer()
                 HStack(spacing: 0) {
                     Text("Don't have an account? ")
                         .foregroundColor(Color.white)
                     Button(action: {}) {
                         Text("Sign Up")
                             .foregroundColor(.blue)
                     }
                 }
             }
             .background(
                RadialGradient(gradient: Gradient(colors: [.red,.black, .white]), center: .center, startRadius: 2, endRadius: 650)
                     .edgesIgnoringSafeArea(.all))
             
         }
     }
 }

 extension Color {
     static var themeTextField: Color {
         return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
     }
 }
