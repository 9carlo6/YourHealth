//
//  appointment.swift
//  YourHealth
//
//  Created by bavaroedoardo on 12/01/2021.
//

import SwiftUI
struct Events: Equatable, Identifiable{
    var id = UUID()
    var date: String
    var spec: String
    var via: String
    var status: String
}

struct appointment: View {
   
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    
    @State var isActive : Bool = false
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    @State var events = [Events(date: "Jan 01, 2020", spec: "Luca Giordano", via:"Via Benevento 28, 83000", status:"Completed")]
    @State var eventss = [Events(date: "Jan 01, 2020", spec: "Luca Giordano", via:"Via Benevento 28, 83000", status:"Completed"),Events(date: "Jan 18, 2020", spec: "Marco Giordano", via:"Via Benevento 28, 83000", status:"Completed")]
    var body: some View {
        NavigationView{
            ZStack{
                navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
                //Cardview
                VStack{
                        if(isActive==false){
                            VStack{
                        ForEach(self.events){event in
                                cardView(date: event.date, spec: event.spec , via: event.via, status: event.status)
                        }
                        }.padding(.bottom, 550)
                        }else{
                            VStack{
                            ForEach(self.eventss){event in
                                    cardView(date: event.date, spec: event.spec , via: event.via, status: event.status)
                            }
                        }.padding(.bottom, 350)
                        }
                  
                    
                }
                
            }
            .navigationBarTitle("")
            .navigationBarItems(leading: Text("Appointments")
                                    .font(.largeTitle)
                                    .bold()
                                ,trailing: NavigationLink(destination: ACalendarView(), label: {
                                    Image(systemName: "plus")
                                })
                        )
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

    }
}

struct appointment_Previews: PreviewProvider {
    static var previews: some View {
        appointment()
    }
}
//visualizzazione calendario
struct ACalendarView: View {
    @State private var selectedDate = Date()
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    var body: some View {
        ZStack{
            navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            NavigationLink(destination: appointment(isActive: true)) {
           DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
           .datePickerStyle(GraphicalDatePickerStyle())
            .frame(width: 300, height: 350)
            .background(Color("Darkpink"))
            .cornerRadius(15)
            .padding(.bottom, 380)
            }
        }
    }
}
//cardview
struct cardView: View {
    var date: String
    var spec: String
    var via: String
    var status: String
    var body: some View {
               
        VStack{
            Text(date)
                .fontWeight(.semibold)
                .font(.largeTitle)
                .padding(.leading)
               Text(spec)
                .font(.title)
                .padding(.leading)
               Text(via)
                .font(.title3)
            Text(status)
             .font(.title3)
        }
        .padding()
        .background(Color("Darkpink"))
        .cornerRadius(15)
        .opacity(0.8)
        .padding(8)
        .shadow(radius: 0.3)
    }
}

