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
                        //Text("You are in Dashboard")
                        Image("lookingatthephone")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300.0, height: 100.0)
                            .padding(.bottom, 180.0)
                            
                        //parte bottoni
                        VStack {
                            
                                    Button(action: {
                                        print("join tapped!")
                                    }) {
                                        HStack {
                                            Text("Join a center")
                                                .fontWeight(.semibold)
                                                .font(.title)
                                        }
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(40)
                                        .padding(.horizontal, 20)
                                    }
                         
                                    Button(action: {
                                        print("create tapped!")
                                    }) {
                                        HStack {
                                            Text("Create a new center")
                                                .fontWeight(.semibold)
                                                .font(.title)
                                        }
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .padding()
                                        .foregroundColor(.black)
                                        .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(40)
                                        .padding(.horizontal, 20)
                                    }
                         
                        }
                        .padding(.top, 400)
                            
                        //fine parte bottoni
                        
                        
                        
                            .navigationBarTitle("")
                            .navigationBarItems(leading: Text("Dashboard")
                                                    .font(.largeTitle)
                                                    .bold()
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
                        Text("You are in Schedule")
                            .navigationBarTitle("")
                            .navigationBarItems(leading: Text("Schedule")
                                                    .font(.largeTitle)
                                                    .bold()
                            )
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
                        Text("You are in Chats")
                            .navigationBarTitle("")
                            .navigationBarItems(leading: Text("Chats")
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
                        Text("Chats")
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
    }
}

struct GradientBackgroundStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
