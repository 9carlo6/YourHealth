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
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    @State private var showAlert = false
    
    @State private var name = ""
    @State private var profession = ""
    @State private var city = ""
    @State private var address = ""
    
    
    
    
    var body: some View {
        
       // NavigationView{
            Form{
               
               Section{
                  
                VStack{
                      
                    Image("dottoressa1")
                          .resizable()
                          .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100, alignment: .center)
                          .cornerRadius(50)
                      
                    Text(name)
                        .fontWeight(.semibold)
                        .font(.title)
                       
                    
                    Text(profession)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.black)
                        .aspectRatio(contentMode: .fit)
                     
                    Text(city + ", " + address)
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
                        /*Alert(title: Text("Logout")
                                .font(.title)
                              
                              , message: Text("Do you want to exit the YourHealth application?")
                                
                              
                              , dismissButton: .default(Text("No")))
                        */
                        Alert(title: Text("Logout")
                                .font(.title)
                              
                              
                              , message: Text("Do you want to exit for YourHealth application?")
                              
                              
                              ,primaryButton: .default(Text("Yes"), action: {
                                try! Auth.auth().signOut()
                                UserDefaults.standard.set(false, forKey: "status")
                                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                                //se fa il logout questa variabile
                                //deve essere impostata a false
                                self.with_center = false
                              })
                              
                              , secondaryButton: .default(Text("No")))
                            
                        
                    }
                    /*Button(action: {
                        
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
                            
                    }*/
                  }
                  .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                  
                  .listRowInsets(EdgeInsets())
                  
                  .background(navColor.edgesIgnoringSafeArea(.all))
                  
               }
               .listRowBackground(navColor)
               .frame(maxWidth: .infinity, alignment: .leading)
           
               
           
            }.onAppear(perform: {
                infoSpecialist()
            })
            .background(navColor.edgesIgnoringSafeArea(.all))
        
    }
    
    
    private func infoSpecialist(){
        
        
        let db = Firestore.firestore()
        
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        
        let docRef = db.collection("Specialists").document(userID)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                
                let data = document.data()
                
                self.name = data?["Name and Surname"] as! String
                print(name)
                self.profession = data?["Profession"] as! String
                self.city = data?["City"] as! String
                self.address = data?["Address"] as! String
                
            } else {
                print("Document does not exist")
            }
        }
        
    }
}

/*struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}*/


