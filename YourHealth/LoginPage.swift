

import SwiftUI

struct LoginPage: View {
    
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //string per form
    @State private var userName = ""
    @State private var userSurname = ""
    @State private var userEmail = ""
    @State private var userPassword = ""
    
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
                            TextField("Name", text: $userName)
                        }
                        Section(header: Text("Surname")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Surname", text: $userSurname)
                        }
                        Section(header: Text("Email")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Email", text: $userEmail)
                        }
                        Section(header: Text("Password")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            SecureField("Password", text: $userPassword)
                        }
                    }
                     
                    //parte bottoni
                    VStack {
                        HStack {
                            //clicca submit per tornare indietro
                            
                            Button("Submit",action: { self.presentationMode.wrappedValue.dismiss() })
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
                    .navigationBarTitle("")
                    .navigationBarItems(leading: Text("Sign Up")
                                            .font(.largeTitle)
                                            .bold())

                    }

            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
