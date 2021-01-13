//
//  appointment.swift
//  YourHealth
//
//  Created by bavaroedoardo on 12/01/2021.
//

import SwiftUI

struct appointment: View {
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
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
           .onChange(of: selectedDate){
           print($0)
           }
//            displayedComponents: .date per non avere la barra time
           .datePickerStyle(GraphicalDatePickerStyle())
            .frame(width: 350, height: 360)
            .background(Color("Darkpink"))
            .cornerRadius(10)
            .foregroundColor(.red)
            .padding(.bottom, 380)
        }
    }
}

struct appointment_Previews: PreviewProvider {
    static var previews: some View {
        appointment()
    }
}
