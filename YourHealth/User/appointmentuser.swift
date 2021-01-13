//
//  appointment.swift
//  YourHealth
//
//  Created by bavaroedoardo on 12/01/2021.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Events: Equatable, Identifiable{
    var id = UUID()
    var date: String
    var spec: String
    var via: String
    var status: String
}



struct appointmentuser: View {

    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    @State private var date = ""
    @State private var spec = ""
    @State private var via = ""
    @State private var status = ""
    @State var with_event: Bool = true
    @State var events = [Events(date: "Jan 01, 2020", spec: "Luca Giordano", via:"Via Benevento 28, 83000", status:"Completed"), Events(date: "Jan 18, 2020", spec: "Giulia Giordano", via:"Via Benevento 28, 83000", status:"In corso")]
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
             // se ha gia un centro
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        
                        //l'immagine poi deve essere scaricata dal database
                        VStack{
                            VStack{
                                ForEach(self.events){event in
                                        CardView(date: event.date, spec: event.spec , via: event.via, status: event.status)
                                           
                                }
                            }
                            
                        }.padding(.bottom, 350)
                        
                    }
                    .navigationBarTitle("")
                    .navigationBarItems(leading: Text("Appointments")
                        .font(.largeTitle)
                        .bold())
                    
                }
//                .onAppear{UserAppointment()} //disattivata per bug
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)

            
            
        
        
    }
//SE QUESTA PARTE VIENE USATA VERRANNO USATI I DATI PRESENTI DEL DB MA C'è UN BUG: aggiunta illimitata di card(la verifica non funziona)
    /*private func UserAppointment() {
                let db = Firestore.firestore()
               guard let userID = Auth.auth().currentUser?.uid else { return }
                
                db.collection("Appointments").whereField("idu", isEqualTo: userID)
                    .getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("----------Error getting documents: \(err)-----------------------")
                        } else {
                            if(querySnapshot!.documents.isEmpty){
                                                print("-----------------------l'utente non ha appuntamenti--------------------------------------------")
                                
                                            }else{
                                                for document in querySnapshot!.documents {
                                                    print("\(document.documentID) => \(document.data())")
                                                    let data = document.data()
                                                    let date = data["date"] as! String
                                                    let spec = data["spec"]as! String
                                                    let via = data["via"] as! String
                                                    let status = data["status"] as! String
                                                   //questo if sotto non funziona e quindi c'è il bug
                                                    if(!self.events.contains(Events(date: date, spec: spec, via: via, status: status))){
                                                    self.events.append(Events(date: date, spec: spec, via: via, status: status))
                                                    }
                                                }
                                               
                                            }
                        }
                }
            }*/
        
}

struct appointmentuser_Previews: PreviewProvider {
    static var previews: some View {
        appointmentuser()
    }
}
struct DetailView: View {
    var body: some View {
        Text("Test1")
    }
}

struct CardView: View {
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
