//
//  SignInView.swift
//  YourHealth
//
//  Created by pannullocarlo on 07/01/2021.
//

import SwiftUI

struct SignInView : View {
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }

    @State var email: String = "prova@gmail.com"
    @State var password: String = "password"
    @State var loading = false
    @State var error = false

    @EnvironmentObject var session: SessionStore

    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //per nascondere il bottone di ritorno
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""

    var body: some View {
            ZStack{
                //per il colore di background di tutta la view
                navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                ZStack{
                    //per il colore di background di dello ZStack
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Form {
                        
                        Section(header: Text("Email")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Email", text: $email)
                        }
                        Section(header: Text("Password")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            SecureField("Password", text: $password)
                        }
                    }
                     
                    //parte bottoni
                    VStack {
                        HStack {
                            //clicca submit per tornare indietro
                            
                            if (error) {
                                Text("errore nel sign in")
                            }
                            
                            NavigationLink(destination: ContentView().environmentObject(SessionStore())) {
                                    Text("Sign In")
                                }.simultaneousGesture(TapGesture().onEnded{
                                signIn()
                            })
                            
                            
                        }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                            .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                            .padding(.horizontal, 20)
                        }
                        .padding(.top, 450)
                    //fine parte bottoni
                    .navigationBarTitle("")
                    .navigationBarItems(leading: Text("Sign In")
                                            .font(.largeTitle)
                                            .bold())

                    }
            }
        
    }
}

