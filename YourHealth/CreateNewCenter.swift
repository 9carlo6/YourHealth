//
//  CreateNewCenter.swift
//  YourHealth
//
//  Created by pannullocarlo on 29/12/2020.
//
import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CreateNewCenter: View {
    
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //string per form
    @State private var centerName = ""
    @State private var centerEmail = ""
    @State private var centerWebSite = ""
    @State private var centerPhone = ""
    
    //variabile necessaria per aggiornare il conenuto della dashboard
    @Binding var with_center: Bool
    
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    
    //variabile globale per capire se l'utente
    //è autenticato o meno
    var userSettings = UserSettings()
    
    
    var body: some View {
        ZStack{
            //per il colore di background di tutta la view
            navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            NavigationView{
                ZStack{
                    //per il colore di background di dello ZStack
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Form {
                        Section(header: Text("Center Name")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Name", text: $centerName)
                        }
                        Section(header: Text("Center Email")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Email", text: $centerEmail)
                        }
                        Section(header: Text("Center Website")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Website", text: $centerWebSite)
                        }
                        Section(header: Text("Center Phone")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Phone", text: $centerPhone)
                        }
                    }
                    //parte bottoni
                    VStack {
                        HStack {
                            //clicca submit per tornare indietro
                            
                            Button(action: { self.presentationMode.wrappedValue.dismiss()
                                createNewCenter(name: centerName,email: centerEmail,website: centerWebSite,phone: centerPhone)
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
                        .padding(.top, 470)
                    //fine parte bottoni
                    .navigationBarTitle("")
                    .navigationBarItems(leading: Text("Create New Center")
                                            .font(.largeTitle)
                                            .bold())
                    }

            }
        }
    }
    
    //funzione per creare un nuovo centro
    private func createNewCenter(name: String, email: String, website: String, phone: String) {
            let userID = Auth.auth().currentUser!.uid
            let db = Firestore.firestore()
            var ref: DocumentReference? = nil
            ref = db.collection("Centers").addDocument(data: [
                "Name": name,
                "Email": email,
                "Website": website,
                "Phone": phone,
                "Owner": userID,
                "Code": randomString(length: 5)
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                    //cambia il valore della variabile with_center
                    //per aggiornare la dashboard con il nuovo centro scaricato
                    with_center = true
                }
            }
    }
    
    //per generare un codice per lo studio
    //ovviamente non andrebbe fatto cosi
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}



/*
 NON SO COME FARE FUNZIONARE LA PREVIEW QUANDO C'è UNA VARIABILE
 BINDING QUINDI LA COMMENTO
struct CreateNewCenter_Previews: PreviewProvider {
    @Binding var with_center: Bool
    
    static var previews: some View {
        CreateNewCenter()
    }
}
 */
