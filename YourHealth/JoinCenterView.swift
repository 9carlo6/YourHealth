//
//  JoinCenterView.swift
//  YourHealth
//
//  Created by pannullocarlo on 27/12/2020.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


struct JoinCenterView: View {
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //string per form
    @State private var code = ""
    
    //per nascondere il bottone di ritorno
    @State var navigationBarBackButtonHidden = true
    
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    
    //per l'allert
    @State private var showingAlert = false
    
    //variabile necessaria per aggiornare il conenuto della dashboard
    @Binding var with_center: Bool
    
    var body: some View {
        NavigationView{
            ZStack{
                //per il colore di background di dello ZStack
                navColor.edgesIgnoringSafeArea(.all)
                Form {
                    Section(header: Text("Enter the code you recived")
                                .fontWeight(.light)
                                .font(.headline)
                                .foregroundColor(.black)){
                        TextField("Code", text: $code)
                    }
                }
                //parte bottoni
                VStack {
                    HStack {
                        Button(action: { self.presentationMode.wrappedValue.dismiss()
                            AddUserToCenterWithCode(code: code)
                         }) {
                            Text("Submit")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                }
                .padding(.top, 400)
                //fine parte bottoni
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Join a Center")
                                        .font(.largeTitle)
                                        .bold())
                
                
            }
        }
        
        
    }
    
    //Questa funzione serve per capire se l'utente ha un centro.
    //Nel caso in cui è già all'interno di un centro allora
    //non può entrare in unaltro centro.
    //Invece cambia il valore della variabile with_center a true
    //se il codice è giusto e accede a un centro esistente.
    //Inoltre fa una query per prendere tutti i dati relativi
    //al centro.
    private func AddUserToCenterWithCode(code: String) {
        //istanza database
        let db = Firestore.firestore()
        //user id
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        //entriamo nella collezione centers per vedere se l'utente
        //loggato è gia un proprietario
        db.collection("Centers").whereField("Owner", isEqualTo: userID)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    //se l'utente connesso non è proprietario di nessun centro
                    //allora bisogna vedere se il centro con il codice esiste
                    if(querySnapshot!.documents.isEmpty){
                        //si controlla l'esistenza del centro con il codice
                        //inserito dall'utente
                        db.collection("Centers").whereField("Code", isEqualTo: code)
                            .getDocuments() { (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    //se non esiste nessun centro allora il flag
                                    //with_center = false
                                    //e dovrebbe uscire un errore
                                    //"IL CENTRO CON QUEL CODICE NON ESISTE"
                                    if(querySnapshot!.documents.isEmpty){
                                        self.with_center = false
                                    }else{
                                        //si modifica il centro aggiungendo lo specialista
                                        for document in querySnapshot!.documents {
                                            print("\(document.documentID) => \(document.data())")
                                            db.collection("Centers").document(document.documentID).updateData(["Specialists.\(userID)" : userID])
                                        }
                                        self.with_center = true
                                    }
                                }
                            }
                    }
                }
            }
    }
}
