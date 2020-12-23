//
//  ContentView.swift
//  YourHealth
//
//  Created by pannullocarlo on 22/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        
        ZStack{
            TabView{
                NavigationView{
                    Form{
                        Section{
                            Text("Hello World")
                        }
                    }
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
                .tabItem {
                    Image(systemName: "doc.circle.fill")
                    Text("Dashboard")
                }
                
                Text("schedule")
                    .tabItem {
                        Image(systemName: "calendar.circle.fill")
                        Text("Schedule")
                    }
                Text("chats")
                    .tabItem {
                        Image(systemName: "message.circle.fill")
                        Text("Chats")
                    }
                Text("specialist")
                    .tabItem {
                        Image(systemName: "asterisk.circle.fill")
                        Text("Specialist")
                    }
                Text("settings")
                    .tabItem {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
            }
            
        }.background(Color.black.opacity(0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
