

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct LoginPageSpecialist: View {
    
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //string per form
    @State private var spName = ""
    @State private var spSurname = ""
    @State private var spEmail = ""
    @State private var spPassword = ""
    @State private var spCode = ""
    //per nascondere il bottone di ritorno
    @Environment(\.presentationMode) var presentationMode
    @State var name = ""
    
    var body: some View {
        
        NavigationView{
            
        ZStack{
            //per il colore di background di tutta la view
            navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            /*
            //Per nascondere il bottone di ritorno
            Button("Show back") {
                        self.navigationBarBackButtonHidden = false
                    }.navigationBarBackButtonHidden(navigationBarBackButtonHidden)
            */
                ZStack{
                    //per il colore di background di dello ZStack
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Form {
                        Section(header: Text("Name")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Name", text: $spName)
                        }
                        Section(header: Text("Surname")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Surname", text: $spSurname)
                        }
                        Section(header: Text("Email")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Email", text: $spEmail)
                        }
                        Section(header: Text("Password")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            SecureField("Password", text: $spPassword)
                        }
                        Section(header: Text("Professional board code")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            SecureField("Code", text: $spCode)
                        }
                    }
                     
                    //parte bottoni
                    VStack {
                        HStack {
                            //clicca submit per tornare indietro
                            
                            Button("Submit",action: {
                                createNewCenter(email: spEmail,password: spPassword)
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
                    .navigationBarItems(leading: Text("Sign Up")
                                            .font(.largeTitle)
                                            .bold())

                    }

            }
        }
    }
}
//funzione per registrare un nuovo specialista
private func createNewCenter(email: String, password: String) {
        
    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in // ..
        
    }
}

struct LoginPageSpecialist_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageSpecialist()
    }
}
