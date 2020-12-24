//
//  LoginPage.swift
//  YourHealth
//
//  Created by bavaroedoardo on 24/12/2020.
//

import SwiftUI

struct LoginPage: View {
    var body: some View {
        ZStack(){
            NavigationView{
                ZStack{
            Color(red: 255/255, green: 240/255, blue: 240/255).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
            Text("YourHealth")
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .font(.system(size: 70))
                .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
                .padding(.top, 120.0)
                Spacer()
            Image("slides1")
                .resizable()
                .scaledToFill()
                .frame(width: 900.0, height: 250.0)
                .padding(.bottom, 60.0)
                    }
                }
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
