//
//  appointment.swift
//  YourHealth
//
//  Created by bavaroedoardo on 12/01/2021.
//

import SwiftUI

struct appointmentuser: View {
    @State private var selectedDate = Date()
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    
    
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            navColor.edgesIgnoringSafeArea(.all)
            VStack{
                CardView(text: "ciao")
            }
           }
    }
}

struct appointmentuser_Previews: PreviewProvider {
    static var previews: some View {
        appointmentuser()
    }
}

struct CardView: View {
    var text: String
    var body: some View {
            overlay(
                Text(text)
                    .fontWeight(.heavy)
                    .font(.system(.headline, design: .rounded))
                    .padding()
                    .background(Color("Darkpink"))
                    .cornerRadius(20)
                    .opacity(0.8)
                    .padding(),
                alignment: .top
        )
    }
}
