//
//  Settings.swift
//  YourHealth
//
//  Created by conteangelo on 06/01/2021.
//
import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

struct Settings: View {
    
    @Environment(\.presentationMode) var presentationMode


    
    //variabile necessaria per aggiornare il conenuto della dashboard
    @Binding var with_center: Bool
    
    /*init(){
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
        
        
       
        
        
    }*/
    
    
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    
    var body: some View {
        
       // NavigationView{
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
                      
                    Button(action: {
                        
                        try! Auth.auth().signOut()
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                        //se fa il logout questa variabile
                        //deve essere impostata a false
                        self.with_center = false
                        
                    }) {
                        
                        Text("Logout")
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
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
       // }
        
    }
}

/*struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}*/
