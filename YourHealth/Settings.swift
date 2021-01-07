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
                           
                         
                           ZStack{
                               Image(systemName: "person.fill")
                                   .resizable()
                                   .frame(width: 25, height: 25, alignment: .leading)
                                   
                                   .frame(width:17, height: 20)
                                   //.padding(.leading, 4)
                           }
                           .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                           .background(Color("Darkpink"))
                           .cornerRadius(15)
                              
                              
                          
                          
                           Text("Profile")
                               
                          
                      }
                       .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                       
                       .listRowInsets(EdgeInsets())
                       
                       .background(navColor.edgesIgnoringSafeArea(.all))
                       
                       
                   
                   
                   
                  HStack{
                   
                   ZStack{
                       Image(systemName: "mail.fill")
                           .resizable()
                           .frame(width: 20, height: 20, alignment: .leading)
                           
                           .frame(width:17, height: 20)
                           //.padding(.leading, 4)
                   }
                   .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                   .background(Color("Darkpink"))
                   .cornerRadius(15)
                   //Image(systemName: "mail.fill")
                       
                      
                       Text("Notification")
                  }
                  .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                  
                  .listRowInsets(EdgeInsets())
                  
                  .background(navColor.edgesIgnoringSafeArea(.all))
                  
                  
                  
                  
                  HStack{
                      
                       ZStack{
                           Image("help")
                               .resizable()
                               .frame(width: 25, height: 25, alignment: .leading)
                               
                               .frame(width:17, height: 20)
                               //.padding(.leading, 4)
                       }
                       .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                       .background(Color("Darkpink"))
                       .cornerRadius(15)
                          
                      
                       Text("Help")
                  }
                  .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                  
                  .listRowInsets(EdgeInsets())
                  
                  .background(navColor.edgesIgnoringSafeArea(.all))
                  
                  HStack{
                      
                      
                      
                       ZStack{
                           Image("logout")
                               .resizable()
                               .frame(width: 25, height: 25, alignment: .leading)
                               
                               .frame(width:17, height: 20)
                               //.padding(.leading, 4)
                       }
                       .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                       .background(Color("Darkpink"))
                       .cornerRadius(15)
                      
                       Text("Log out")
                  }
                  .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                  
                  .listRowInsets(EdgeInsets())
                  
                  .background(navColor.edgesIgnoringSafeArea(.all))
                  
               }
               .listRowBackground(navColor)
               .frame(maxWidth: .infinity, alignment: .leading)
           
               
           
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
