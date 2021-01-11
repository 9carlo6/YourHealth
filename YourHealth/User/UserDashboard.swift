//
//  UserDashboard.swift
//  YourHealth
//
//  Created by pannullocarlo on 11/01/2021.
//

import SwiftUI

struct UserDashboard: View {
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    //string per form
    @State private var city = ""
    
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack{
            //per il colore di background di dello ZStack
            navColor.edgesIgnoringSafeArea(.all)
            
            Form {
                Section(header: Text("Enter the name of the city where you are")
                            .fontWeight(.light)
                            .font(.headline)
                            .foregroundColor(.black)){
                    TextField("City", text: $city)
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = navColorUI
             }
            
            //parte della lista dei centri nella citta
            
        }    
    }
}

struct UserDashboard_Previews: PreviewProvider {
    static var previews: some View {
        UserDashboard()
    }
}
