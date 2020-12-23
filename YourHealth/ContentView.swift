//
//  ContentView.swift
//  YourHealth
//
//  Created by pannullocarlo on 22/12/2020.
//

import SwiftUI



struct ContentView: View {
    
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    
    var body: some View{

        ZStack{
            TabView{
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Dashboard")
                            .navigationBarTitle(Text("Dashboard"))
                            .navigationBarItems(trailing:
                                HStack {
                                    Button(action: {
                                        print("ciao")
                                    }, label:{
                                        Image(systemName: "trash")
                                    })
                                }
                            )
                    }
                }
                .tabItem {
                    Image(systemName: "doc.circle.fill")
                    Text("Dashboard")
                }
                
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Schedule")
                            .navigationBarTitle(Text("Schedule"))
                            .navigationBarItems(trailing:
                                HStack {
                                    Button(action: {
                                        print("Schedule")
                                    }, label:{
                                        Image(systemName: "trash")
                                    })
                                }
                            )
                    }
                }
                    .tabItem {
                        Image(systemName: "calendar.circle.fill")
                        Text("Schedule")
                    }
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Chats")
                            .navigationBarTitle(Text("Chats"))
                            .navigationBarItems(trailing:
                                HStack {
                                    Button(action: {
                                        print("Chats")
                                    }, label:{
                                        Image(systemName: "trash")
                                    })
                                }
                            )
                    }
                }
                    .tabItem {
                        Image(systemName: "message.circle.fill")
                        Text("Chats")
                    }
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Specialists")
                            .navigationBarTitle(Text("Specialists"))
                            .navigationBarItems(trailing:
                                HStack {
                                    Button(action: {
                                        print("Specialists")
                                    }, label:{
                                        Image(systemName: "trash")
                                    })
                                }
                            )
                    }
                }
                    .tabItem {
                        Image(systemName: "asterisk.circle.fill")
                        Text("Specialist")
                    }
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text("Settings")
                            .navigationBarTitle(Text("Settings"))
                            .navigationBarItems(trailing:
                                HStack {
                                    Button(action: {
                                        print("Settings")
                                    }, label:{
                                        Image(systemName: "trash")
                                    })
                                }
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
