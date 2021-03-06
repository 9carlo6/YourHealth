//
//  SettingsUser.swift
//  YourHealth
//
//  Created by conteangelo on 10/01/2021.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

struct SettingsUser: View {
    //variabile necessaria per aggiornare il conenuto della dashboard
    
    //@Binding var with_center: Bool
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    @State private var showAlert = false
    
    //variabile necessaria per aggiornare il conenuto della dashboard
    @Binding var with_center_User: Bool
    
    @State private var name = ""
    
    var body: some View {
        Form{
            
           
           Section{
              
              VStack{
                  
                  
                  Image("pippo")
                      .resizable()
                      .frame(width: 150, height: 150, alignment: .center)
                      .cornerRadius(50)
                      
                      
                  
                  Text(name)
                    .fontWeight(.semibold)
                    .font(.title)
                    
                      
                      
                 
                  Text("Benevento (BN), 9/09/1973")
                      .font(.system(.body, design: .rounded))
                      .foregroundColor(.black)
                      .aspectRatio(contentMode: .fit)
                
                  
                  
              }
              
              
    
           }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
           
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
                   
                  
                   Text("Notifications")
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
                    
                    self.showAlert.toggle()
                }){
                
                    
                    Text("Logout")
                        .foregroundColor(.black)
                        .padding(.vertical)
                    

                    
                }.alert(isPresented: $showAlert){
                   
                    Alert(title: Text("Logout")
                            .font(.title)
                          
                          
                          , message: Text("Do you want to exit for YourHealth application?")
                          
                          
                          ,primaryButton: .default(Text("Yes"), action: {
                            try! Auth.auth().signOut()
                            UserDefaults.standard.set(false, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                            
                            //se fa il logout questa variabile
                            //deve essere impostata a false
                            self.with_center_User = false
                            
                          })
                          
                          , secondaryButton: .default(Text("No")))
                        
                    
                }
              }
              .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
              
              .listRowInsets(EdgeInsets())
              
              .background(navColor.edgesIgnoringSafeArea(.all))
              
           }
           .listRowBackground(navColor)
           .frame(maxWidth: .infinity, alignment: .leading)
       
           
       
        }.onAppear(perform: {
            infoUser()
        })
        
        .background(navColor.edgesIgnoringSafeArea(.all))
       
    
    }
    
    private func infoUser(){
        
        
        let db = Firestore.firestore()
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        
        let docRef = db.collection("Users").document(userID)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                
                let data = document.data()
                self.name = data?["Name and Surname"] as! String
                print(name)
            } else {
                print("Document does not exist")
            }
        }
        
    }
    
}


/*struct SettingsUser_Previews: PreviewProvider {
    static var previews: some View {
        SettingsUser()
    }
}
*/





