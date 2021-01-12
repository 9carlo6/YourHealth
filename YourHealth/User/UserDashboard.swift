//
//  UserDashboard.swift
//  YourHealth
//
//  Created by pannullocarlo on 11/01/2021.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


struct UserDashboard: View {
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    //string per form
    @State private var city_center : String = ""
    
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    @State var cities = ["Napoli - Fox Hound", "Bergamo - Cortex Island"]
    
    @State private var searchText : String = ""
    
    var body: some View {
        VStack {
            
            SearchBar(text: $searchText, placeholder: "Enter the name of the city where you are")
            List {
                ForEach(self.cities.filter {
                    self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
                }, id: \.self) { city_center in
                    NavigationLink(destination: SelectedCenterInfoView(city_center: city_center)) {
                    Text(city_center)
                    }
                    
                }.listRowBackground(navColor)
            }
            
        }.onAppear{
            CentersList()
        }
    }
    
    
    
    //Questa funzione serve per prendere la lista dei centri dal database
    //INIZIO FUNZIONE
    private func CentersList() {
        //istanza database
        let db = Firestore.firestore()
        //user id
        //guard let userID = Auth.auth().currentUser?.uid else { return }
        
        //entriamo nella collezione centers per vedere se l'utente
        //loggato è gia un proprietario
        db.collection("Centers").getDocuments() {
            (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if(querySnapshot!.documents.isEmpty){
                        //questa cosa però non dovrebbe succedere
                        //in quanto si prevede la presena di almeno un centro nel db
                        print("non ci sono centri nel db")
                    }else{
                        print("ci sono centri nel db")
                        //si prendono tutte le citta dei centri e si uniscono
                        //all'array cities
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                            let data = document.data()
                            let city = data["City"] as! String
                            let center = data["Name"] as! String
                            if(!self.cities.contains(city + " - " + center)){
                                //viene aggiunto il centro solo se non è
                                //già in lista
                                self.cities.append(city + " - " + center)
                            }
                            
                        }
                    }
                }
        }
        
    }
    //FINE FUNZIONE
    
    
}

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
}







struct UserDashboard_Previews: PreviewProvider {
    static var previews: some View {
        UserDashboard()
    }
}




struct SelectedCenterInfoView: View {
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    //variabile necessaria per aggiornare il conenuto della dashboard
    @State var city_center: String
    @State var centerName = ""
    @State private var centerEmail = ""
    @State private var centerWebSite = ""
    @State private var centerPhone = ""
    @State private var centerCode = ""
    @State private var centerCity = ""

    
    var body: some View {
        NavigationView{
            ZStack{
                navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                //l'immagine poi deve essere scaricata dal database
                VStack{
                    VStack{
                        Image("center")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200.0, height: 100.0)
                            .padding(50)
                            
                        Text(self.centerName)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        Text(self.centerEmail)
                            .font(.title2)
                        Text(self.centerWebSite)
                            .font(.title2)
                        Text(self.centerPhone)
                            .font(.title2)
                        Text(self.centerCity)
                            .font(.title2)
                        
                    }
                    .padding(.bottom, 180)
                    
                }
                
            }
            
        }
        .navigationBarTitle("")
        .navigationBarItems(leading: Text("Center Info")
                                .font(.largeTitle)
                                .bold())
        .onAppear{
            SelectedCenterInfo()
        }
    }
    
    
    
    //Questa funzione serve per prendere le info del centro selezionato
    //INIZIO FUNZIONE
    private func SelectedCenterInfo() {
        //istanza database
        let db = Firestore.firestore()
        //user id
        //guard let userID = Auth.auth().currentUser?.uid else { return }
        
        //MODO CONTORTO DI ELIMINARE DEI CARATTERI DALLA STRINGA.
        //IL PROBLEMA NASCE NEL MOMENTO IN CUI NON PASSO UN OGGETTO
        //CENTRO (IN QUANTO NON ESISTE LA CLASSE) MA SOLO IL NOME
        //DELLA CITTA DEL CENTRO CONCATENATO CON UN TRATTINO
        //AL NOME DEL CENTRO. QUINDI QUESTE RIGHE DI CODICE SERVONO
        //PER ELIMINARE LA PARTE INIZIALE DELLA STRINGA FINO AL "- ".
        let ending = city_center.firstIndex(of: "-") ?? city_center.endIndex
        let centerName = String(city_center[ending...])
        let ending1 = centerName.firstIndex(of: " ") ?? centerName.endIndex
        var centerName1 = String(centerName[ending1...])
        centerName1.remove(at: centerName1.startIndex)
        
        print(centerName)
        //entriamo nella collezione centers per vedere se l'utente
        //loggato è gia un proprietario
        db.collection("Centers").whereField("Name", isEqualTo: centerName1)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if(querySnapshot!.documents.isEmpty){
                        //questa cosa però non dovrebbe succedere
                        //in quanto si prevede la presena di almeno un centro nel db
                        print("non ci sono centri nel db con questo nome")
                    }else{
                        print("ci sono centri nel db con questo nome")
                        //si prendono tutte le citta dei centri e si uniscono
                        //all'array cities
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                            let data = document.data()
                            self.centerName = data["Name"] as! String
                            self.centerEmail = data["Email"] as! String
                            self.centerWebSite = data["Website"] as! String
                            self.centerPhone = data["Phone"] as! String
                            self.centerCode = data["Code"] as! String
                            self.centerCity = data["City"] as! String
                            
                        }
                    }
                }
        }
        
    }
    //FINE FUNZIONE
}
