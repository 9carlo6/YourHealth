//
//  ListaSpecialisti.swift
//  YourHealth
//
//  Created by conteangelo on 06/01/2021.
//

import SwiftUI

struct ListaSpecialisti: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var specialists = [Specialist(image: "dottoressa1", name: "Giulia Giordano", role: "Psychologist"), Specialist(image: "dottore1", name: "Paolo Verdi", role: "Neuropsychologist"), Specialist(image: "images-1", name: "Saverio Rossi", role: "Psychiatrist"), Specialist(image: "images-2", name: "Cassandra Mora", role: "Psychotherapist"), Specialist(image: "images", name: "Debora Bruni", role: "Neuropsychologist"), Specialist(image: "Unknown-1", name: "Giuseppe Conti", role: "Psychologist"), Specialist(image: "Unknown", name: "Mauro Pirlo", role: "Psychotherapist")
    ]
    
    private var displayOrder = ["Alphabetical", "Show Favorite First"]
    
    @State private var selectedOrder = 0
    
    init(){
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.backgroundColor = UIColor.init(Color("LightPink"))
        
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
        //Cambio della freccia
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        
        UINavigationBar.appearance().tintColor = UIColor.black
        
        
        //Rimuove la linea nella NavigationBar
        navBarAppearance.configureWithTransparentBackground()
        
        
        //
        UITableView.appearance().backgroundColor = .clear
        
    }
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    var body: some View {
        ZStack{
            
            //NavigationView{
                
                VStack(alignment: .leading){
                    Text("Discover the specialists who work at this center")
                        .padding(.leading, 20)
                        .foregroundColor(.secondary)
                        .padding(.bottom, -5)
                        
                
                    List(){
                        ForEach(specialists){ specialist in
                            
                                VStack(alignment: .leading){
                                    
                                    BasicSpecialist(specialist: specialist)
                                    
                                        
                                    NavigationLink(destination: ProfileSpecialist(specialist: specialist)){
                                       
                                    EmptyView()
                                            
                                            
                                    }
                                    .frame(width: 0)
                                    .opacity(0)
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                
                                .listRowInsets(EdgeInsets())
                                
                                .background(navColor.edgesIgnoringSafeArea(.all))
                                
                                
                        }
                        
        
                        .listRowBackground(Color("LightPink"))
                        
                    }
                }
                
                
                .background(navColor.edgesIgnoringSafeArea(.all))
               // }
            
            }
        
       
        
   }
    
}

struct ListaSpecialisti_Previews: PreviewProvider {
    static var previews: some View {
        ListaSpecialisti()
    }
}


