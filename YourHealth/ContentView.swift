//
//  ContentView.swift
//  YourHealth
//
//  Created by pannullocarlo on 22/12/2020.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift



struct ContentView: View {
    
    //var db: Firestore!
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    //variabile globale per capire se l'utente
    //è autenticato o meno
    var userSettings = UserSettings()
    
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    
    
    
    var body: some View{
        
        TabView{
            //questo è quello che si vede all'interno
            //della navigation view Dashboard
            NavigationView{
                ZStack{
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Image("lookingatthephone")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300.0, height: 100.0)
                        .padding(.bottom, 180.0)
                    
                    //parte bottoni
                    VStack {
                        HStack {
                            NavigationLink(destination: JoinCenterView()) {
                            Text("Join a center")
                                .fontWeight(.semibold)
                                .font(.title)
                            }
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .padding(.horizontal, 20)
                    
         
                    
                        HStack {
                            NavigationLink(destination: CreateNewCenter()) {
                            Text("Create a new center")
                                .fontWeight(.semibold)
                                .font(.title)
                            
                            }
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.black)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .padding(.horizontal, 20)
                     
                    }
                    .padding(.top, 400)
                        
                    //fine parte bottoni
                    
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Dashboard")
                                        .font(.largeTitle)
                                        .bold())
                
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tabItem() {
                Image(systemName: "doc.circle.fill")
                Text("Dashboard")

            }
            //questo è quello che si vede all'interno
            //della navigation view Appointments
            NavigationView{
                ZStack{
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("You are in Appointments")
                        
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Appointments")
                                        .font(.largeTitle)
                                        .bold()
                )
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "calendar.circle.fill")
                Text("Appointments")
            }
            //questo è quello che si vede all'interno
            //della navigation view Chats
            NavigationView{
                ZStack{
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("You are in Notifications")
                        
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Notifications")
                                        .font(.largeTitle)
                                        .bold()
                                    ,trailing: Button(action: {
                                        //qua va l'azione

                                    }, label: { Image(systemName: "magnifyingglass")
                                    })
                            )
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "message.circle.fill")
                Text("Notifications")
            }
            //questo è quello che si vede all'interno
            //della navigation view Specialists
            NavigationView{
                ZStack{
                    Text("You are in Specialist")
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Specialist")
                                        .font(.largeTitle)
                                        .bold()
                )
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "asterisk.circle.fill")
                Text("Specialist")
            }
            //questo è quello che si vede all'interno
            //della navigation view Settings
            NavigationView{
                ZStack{
                    
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    //parte da cancellare serve per fare il logout
                    VStack{
                        
                        Button(action: {
                            
                            try! Auth.auth().signOut()
                            UserDefaults.standard.set(false, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                            
                        }) {
                            
                            Text("Logout")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 30)
                        .padding()
                        .foregroundColor(.black)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .padding(.top, 25)
                    }
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Settings")
                                        .font(.largeTitle)
                                        .bold()
                )
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .accentColor(.black)
        .onAppear() {
            UITabBar.appearance().barTintColor = tabColor
               }
      }
           
        
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
