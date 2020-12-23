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
        }.background(Color.black.opacity(0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
