//
//  ContentView.swift
//  YourHealth
//
//  Created by pannullocarlo on 22/12/2020.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift



struct ContentView: View {
    
    //var db: Firestore!
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    //variabili utilizzate per la navigationview della dashboard
    @State var with_center: Bool = false
    @State private var centerName = ""
    @State private var centerEmail = ""
    @State private var centerWebSite = ""
    @State private var centerPhone = ""
    @State private var centerCode = ""
    @State private var centerCity = ""
    
    
    var body: some View{
        
        TabView{
            //questo è quello che si vede all'interno
            //della navigation view Dashboard
            if(with_center){ // se ha gia un centro
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
                                
                            VStack{
                                Text("This is the code to enter your center")
                                Text(self.centerCode)
                                    .font(.title2)
                            }.padding(.top, 50)
                            
                        }
                        
                    }
                    .navigationBarTitle("")
                    .navigationBarItems(leading: Text("Dashboard")
                        .font(.largeTitle)
                        .bold())
                    
                }
                .onAppear{UserInfo()}
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .tabItem() {
                    Image(systemName: "doc.circle.fill")
                    Text("Dashboard")
                }
            }else{ //se non ha ancora un centro
                NavigationView{
                    ZStack{
                        navColor.edgesIgnoringSafeArea(.all)
                        Image("lookingatthephone")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300.0, height: 100.0)
                            .padding(.bottom, 180.0)
                        
                        //parte bottoni
                        VStack {
                            HStack {
                                NavigationLink(destination: JoinCenterView(with_center: $with_center)) {
                                Text("Join a center")
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
                        
             
                        
                            HStack {
                                NavigationLink(destination: CreateNewCenter(with_center: $with_center)) {
                                Text("Create a new center")
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
                        
                    }
                    .navigationBarTitle("")
                    .navigationBarItems(leading: Text("Dashboard")
                        .font(.largeTitle)
                        .bold())
                    
                }
                .onAppear{UserInfo()}
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .tabItem() {
                    Image(systemName: "doc.circle.fill")
                    Text("Dashboard")
                }
            }
            
            //questo è quello che si vede all'interno
            //della navigation view Appointments
            NavigationView{
                ZStack{
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    appointment()
                        
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Appointments")
                                        .font(.largeTitle)
                                        .bold()
                                    ,trailing: Button(action: {
                                        //qua va l'azione

                                    }, label: { Image(systemName: "plus")
                                    })
                            )
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "calendar.circle.fill")
                Text("Appointments")
            }
            //questo è quello che si vede all'interno
            //della navigation view Chats
            NavigationView{
                ZStack{
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("You are in Notifications")
                        
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Notifications")
                                        .font(.largeTitle)
                                        .bold()
                                    ,trailing: Button(action: {
                                        //qua va l'azione

                                    }, label: { Image(systemName: "magnifyingglass")
                                    })
                            )
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "message.circle.fill")
                Text("Notifications")
            }
            //questo è quello che si vede all'interno
            //della navigation view Specialists
            NavigationView{
                ZStack{
                    ListaSpecialisti()
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Specialists")
                                        .font(.largeTitle)
                                        .bold()
                )
                
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "asterisk.circle.fill")
                Text("Specialists")
            }
            //questo è quello che si vede all'interno
            //della navigation view Settings
            NavigationView{
                ZStack{
                    
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    //parte da cancellare serve per fare il logout
                    VStack{
                        //Mettere il settings
                        Settings(with_center: $with_center)
                    }
                }
                .navigationBarTitle("")
                .navigationBarItems(leading: Text("Settings")
                                        .font(.largeTitle)
                                        .bold()
                )
                
                
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .accentColor(.black)
        .onAppear() {
            UITabBar.appearance().barTintColor = tabColor
               }
      }
           
        
    //Questa funzione serve per capire se l'utente ha un centro.
    //Nel caso in cui è già all'interno di un centro allora
    //cambia il valore della variabile with_center a true.
    //Inoltre fa una query per prendere tutti i dati relativi
    //al centro.
    private func UserInfo() {
        // [START add_ada_lovelace]
        // Add a new document with a generated ID+
        let db = Firestore.firestore()
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        db.collection("Centers").whereField("Owner", isEqualTo: userID)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if(querySnapshot!.documents.isEmpty){
                        //self.with_center = false
                        //nel caso in cui non esite un documento
                        //il cui proprietario è l'utente loggato
                        //allora si controlla se l'utente
                        //fa parte di qualche centro ma non è
                        //il proprietario
                        db.collection("Centers").whereField("Specialists.\(userID)", isEqualTo: userID)
                            .getDocuments() { (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    //se non esiste nessun centro allora il flag
                                    //with_center = false
                                    if(querySnapshot!.documents.isEmpty){
                                        print("l'utente non appartiene a nessun centro")
                                        self.with_center = false
                                    }else{
                                        //nel caso in vui esiste un centro
                                        //nel quale è presente l'utente loggato
                                        //prendiamo i dati del centro
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
                                        self.with_center = true
                                    }
                                }
                            }
                        
                    }else{
                        //nel caso in vui esiste un centro
                        //il cui proprietario è l'utente loggato
                        //prendiamo i dati del centro
                        self.with_center = true
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
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
