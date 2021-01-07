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
    
    @EnvironmentObject var session: SessionStore
    
    func getUser () {
          session.listen()
      }
    
    var body: some View{
        
        Group {
              if (session.session != nil) {
                Text((session.session?.email!)!)
                Button(action: {
                    let firebaseAuth = Auth.auth()
                    do {
                      try firebaseAuth.signOut()
                    } catch let signOutError as NSError {
                      print ("Error signing out: %@", signOutError)
                    }
                 }) {
                    Text("Logut")
                        .fontWeight(.semibold)
                        .font(.title)
                }
              } else {
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
                            .navigationBarTitle("")
                            .navigationBarItems(leading: Text("Dashboard")
                                                    .font(.largeTitle)
                                                    .bold())
                        }
                    }
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
                                .navigationBarTitle("")
                                .navigationBarItems(leading: Text("Appointments")
                                                        .font(.largeTitle)
                                                        .bold()
                                )
                        }
                    }
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
                                .navigationBarTitle("")
                                .navigationBarItems(leading: Text("Notifications")
                                                        .font(.largeTitle)
                                                        .bold()
                                                    ,trailing: Button(action: {

                                                    }, label: { Image(systemName: "magnifyingglass")
                                                    })
                                            )
                        }
                    }
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
                                .navigationBarTitle("")
                                .navigationBarItems(leading: Text("Specialist")
                                                        .font(.largeTitle)
                                                        .bold()
                                )
                        }
                    }
                        .tabItem {
                            Image(systemName: "asterisk.circle.fill")
                            Text("Specialist")
                        }
                    //questo è quello che si vede all'interno
                    //della navigation view Settings
                    NavigationView{
                        ZStack{
                            Text("You are in Settings")
                            navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                .navigationBarTitle("")
                                .navigationBarItems(leading: Text("Settings")
                                                        .font(.largeTitle)
                                                        .bold()
                                )
                        }
                    }
                        .tabItem {
                            Image(systemName: "gearshape.fill")
                            Text("Settings")
                        }
                }
                .accentColor(.black)
                .onAppear() {
                    UITabBar.appearance().barTintColor = tabColor
                       }
              }
            }.onAppear(perform: getUser)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
