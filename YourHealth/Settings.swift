//
//  Settings.swift
//  YourHealth
//
//  Created by conteangelo on 06/01/2021.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.presentationMode) var presentationMode

    
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
        
        NavigationView{
             Form{
                
                Section{
                   
                   VStack{
                       
                       //Mi servirebbe la parte del login
                       Image("dottoressa1")
                           .resizable()
                           .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100, alignment: .center)
                           .cornerRadius(50)
                           
                           
                       
                       Text("Giulia Giordano")
                           .font(.system(.title2, design: .rounded))
                           .fontWeight(.black)
                         
                           
                           
                      
                       Text("Benevento (BN), 29/03/1998")
                           .font(.system(.body, design: .rounded))
                           .foregroundColor(.black)
                           .aspectRatio(contentMode: .fit)
                       
                       
                       
                   }.offset(x: 50, y: 0)
                }
                
                .listRowBackground(navColor)
                
                
                
                
                Section{
                   HStack{
                       Image("profile")
                           .resizable()
                           .frame(width: 25, height: 25, alignment: .leading)
                           
                           
                       
                       
                       Picker(selection: $selectedOrder, label: Text("Account")) {
                            ForEach(0..<displayOrder.count, id: \.self) {
                                Text(self.displayOrder[$0])
                                   
                            }
                        }
                   }
                   
                   HStack{
                       Image(systemName: "mail.fill")
                           
                       
                       Picker(selection: $selectedOrder, label: Text("Notification")) {
                            ForEach(0..<displayOrder.count, id: \.self) {
                                Text(self.displayOrder[$0])
                                   
                            }
                        }
                   }
                   
                   
                   HStack{
                       Image("storage")
                           .resizable()
                           .frame(width: 22, height: 22, alignment: .leading)
                           
                       
                       Picker(selection: $selectedOrder, label: Text("Data and Storage")) {
                            ForEach(0..<displayOrder.count, id: \.self) {
                                Text(self.displayOrder[$0])
                                   
                            }
                        }
                   }
                   
                   
                   HStack{
                       Image("help")
                           .resizable()
                           .frame(width: 25, height: 25, alignment: .leading)
                       
                           
                       
                       Picker(selection: $selectedOrder, label: Text("Help")) {
                            ForEach(0..<displayOrder.count, id: \.self) {
                                Text(self.displayOrder[$0])
                                   
                            }
                        }
                   }
                   
                   HStack{
                       
                       
                       Image("logout")
                           .resizable()
                           .frame(width: 25, height: 25, alignment: .leading)
                       
                           
                       
                       Picker(selection: $selectedOrder, label: Text("Log out")) {
                            ForEach(0..<displayOrder.count, id: \.self) {
                                Text(self.displayOrder[$0])
                                   
                            }
                        }
                   }
                    
                   
                }
                .listRowBackground(navColor)
                
            }
             
             .navigationBarTitle("Settings")
             .background(navColor.edgesIgnoringSafeArea(.all))
        }
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
