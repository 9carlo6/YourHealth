//
//  ContentView.swift
//  YourHealth
//
//  Created by pannullocarlo on 22/12/2020.
//

import SwiftUI



struct ContentView: View {
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    
    var body: some View{

        ZStack{
            TabView{
                //questo è quello che si vede all'interno
                //della navigation view Dashboard
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Dashboard")
                            .navigationBarTitle(
                                Text("Dashboard")
                                    .font(.largeTitle)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            )
                    }
                }
                .tabItem() {
                    Image(systemName: "doc.circle.fill")
                    Text("Dashboard")

                }
                //questo è quello che si vede all'interno
                //della navigation view Schedule
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Schedule")
                            .navigationBarTitle(Text("Schedule"))
                    }
                }
                    .tabItem {
                        Image(systemName: "calendar.circle.fill")
                        Text("Schedule")
                    }
                //questo è quello che si vede all'interno
                //della navigation view Chats
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Chats")
                            .navigationBarTitle(Text("Chats"))
                            .navigationBarItems(trailing:
                                HStack {
                                    Button(action: {
                                        print("ciao")
                                    }, label:{
                                        Image(systemName: "magnifyingglass")
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        
                                    })
                                }
                            )
                    }
                }
                    .tabItem {
                        Image(systemName: "message.circle.fill")
                        Text("Chats")
                    }
                //questo è quello che si vede all'interno
                //della navigation view Specialists
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Specialists")
                            .navigationBarTitle(Text("Specialists"))
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
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Settings")
                            .navigationBarTitle(Text("Settings"))
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
