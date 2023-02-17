//
//  LoginView.swift
//  Black Jack
//
//  Created by Timo Laspe on 17.02.23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var nickname : String = ""
    
    var body: some View {
        ZStack{
            Image("BackgroundWithText")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 25){
                Text("Account erstellen")
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 20))
                TextField("E-Mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                TextField("Passwort", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                TextField("Nickname", text: $nickname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                HStack{
                    Spacer()
                    Button("Registrieren"){
                        
                    }
                    .foregroundColor(Color.orange)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 20))
                    .bold()
                    Spacer()
                    Button("Login"){
                        
                    }
                    .foregroundColor(Color.white)
                    .font(.custom(
                        "Copperplate",
                        fixedSize: 20))
                    Spacer()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
