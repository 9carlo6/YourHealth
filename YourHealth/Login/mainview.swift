//
//  mainview.swift
//  YourHealth
//
//  Created by bavaroedoardo on 29/12/2020.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


struct mainview: View {
    @State private var selected = 0

    var body: some View {
        
        NavigationView{

        TabView() {
            ZStack{
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
                    .padding(.bottom, 250.0)
                            }
                }
                .tabItem {
                Text("1Tab")
                }

            ZStack{
      VStack{
        Text("Who are you?")
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .font(.system(size: 50))
            .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
        //parte bottoni
        VStack {
            
            
            HStack {
                //per eliminare back add navigationBarBackButtonHidden(true)
                NavigationLink(destination: UserLogin()) {
                Text("User")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
                    .font(.title)
                }
                
            }
            .frame(minWidth: 0, maxWidth: 200)
            .padding()
            .foregroundColor(.black)
            .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            
            

        
            HStack {
                NavigationLink(destination: Login()) {
                Text("Specialist")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
                    .font(.title)
                
                }
                
            }
            .frame(minWidth: 0, maxWidth: 200)
            .padding()
            .foregroundColor(.black)
            .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
                
            
         
        }
        Spacer()
        Image("slides1")
            .resizable()
            .scaledToFill()
            .frame(width: 900.0, height: 200.0)
            .padding(.bottom, 250.0)
        }
    }

                .tabItem {
                Text("2Tab")
                }
        }.tabViewStyle(PageTabViewStyle())
        .background(Color(red: 255/255, green: 240/255, blue: 240/255))
        .edgesIgnoringSafeArea(.all)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .onAppear{LogOut()}
    }
    
    private func LogOut() {
        try! Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: "status")
        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
    }

    
}

struct mainview_Previews: PreviewProvider {
    static var previews: some View {
        mainview()
    }
}
