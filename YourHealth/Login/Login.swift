//
//  Login.swift
//  YourHealth
//
//  Created by pannullocarlo on 07/01/2021.
//
import SwiftUI
import Firebase
  
struct Login: View {
  var body: some View {
      
      Home()
  }
}

struct Login_Previews: PreviewProvider {
  static var previews: some View {
      Login()
  }
}

struct Home : View {
    
  @State var show = false
  @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
  
  var body: some View{
          
          VStack{
              
              if self.status{
                  
                  ContentView()
              }
              else{
                  
                  ZStack{
                      
                      NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                          
                          Text("")
                      }
                      .hidden()
                      
                      Login2(show: self.$show)
                  }
              }
          }
          .navigationBarTitle("")
          .navigationBarHidden(true)
          .navigationBarBackButtonHidden(true)
          .onAppear {
              
              NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                  
                  self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
              }
          }
      
  }
}

//questa non viene utilizzata e quindi si puo cancellare

struct Homescreen : View {
  
  var body: some View{
      
      VStack{
          
          Text("Logged successfully")
              .font(.title)
              .fontWeight(.bold)
              .foregroundColor(Color.black.opacity(0.7))
          
          Button(action: {
              
              try! Auth.auth().signOut()
              UserDefaults.standard.set(false, forKey: "status")
              NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
              
          }) {
              
              Text("Log out")
                  .foregroundColor(.white)
                  .padding(.vertical)
                  .frame(width: UIScreen.main.bounds.width - 50)
          }
          .background(Color("Color"))
          .cornerRadius(10)
          .padding(.top, 25)
      }
  }
}

struct Login2 : View {
  
  @State var color = Color.black.opacity(0.7)
  @State var email = ""
  @State var pass = ""
  @State var visible = false
  @Binding var show : Bool
  @State var alert = false
  @State var error = ""
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
  
  var body: some View{
      
      ZStack{
        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
          
          ZStack(alignment: .topTrailing) {
              
              GeometryReader{_ in
                  
                  VStack{
                      
                      Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                      
                      Text("Login to your account")
                          .font(.title)
                          .fontWeight(.bold)
                          .foregroundColor(self.color)
                          .padding(.top, 35)
                      
                      TextField("Email", text: self.$email)
                      .autocapitalization(.none)
                      .padding()
                      .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                      .padding(.top, 25)
                      
                      HStack(spacing: 15){
                          
                          VStack{
                              
                              if self.visible{
                                  
                                  TextField("Password", text: self.$pass)
                                  .autocapitalization(.none)
                              }
                              else{
                                  
                                  SecureField("Password", text: self.$pass)
                                  .autocapitalization(.none)
                              }
                          }
                          
                          Button(action: {
                              
                              self.visible.toggle()
                              
                          }) {
                              
                              Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                  .foregroundColor(self.color)
                          }
                          
                      }
                      .padding()
                      .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
                      .padding(.top, 25)
                      
                      HStack{
                          
                          Spacer()
                          
                          Button(action: {
                              
                              self.reset()
                              
                          }) {
                              
                              Text("Forget password")
                                  .fontWeight(.bold)
                                  .foregroundColor(Color.black)
                          }
                      }
                      .padding(.top, 20)
                      
                      Button(action: {
                          
                          self.verify()
                          
                      }) {
                          
                          Text("Login")
                              .foregroundColor(.black)
                              .padding(.vertical)
                              .frame(width: UIScreen.main.bounds.width - 50)
                      }
                      
                      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                      .padding()
                      .foregroundColor(.black)
                      .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                      .cornerRadius(40)
                      .padding(.top, 25)
                      
                  }
                  .padding(.horizontal, 25)
              }
              
              Button(action: {
                  
                  self.show.toggle()
                  
              }) {
                  
                  Text("Register")
                      .fontWeight(.bold)
                      .foregroundColor(Color.black)
              }
              .padding()
          }
          
          if self.alert{
              
              ErrorView(alert: self.$alert, error: self.$error)
          }
      }
  }
  
  func verify(){
      
      if self.email != "" && self.pass != ""{
          
          Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
              
              if err != nil{
                  
                  self.error = err!.localizedDescription
                  self.alert.toggle()
                  return
              }
              
              print("success")
              UserDefaults.standard.set(true, forKey: "status")
              NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
          }
      }
      else{
          
          self.error = "Please fill all the contents properly"
          self.alert.toggle()
      }
  }
  
  func reset(){
      
      if self.email != ""{
          
          Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
              
              if err != nil{
                  
                  self.error = err!.localizedDescription
                  self.alert.toggle()
                  return
              }
              
              self.error = "RESET"
              self.alert.toggle()
          }
      }
      else{
          
          self.error = "Email Id is empty"
          self.alert.toggle()
      }
  }
}

struct SignUp : View {
  
  @State var color = Color.black.opacity(0.7)
  @State var email = ""
  @State var pass = ""
  @State var repass = ""
  @State var visible = false
  @State var revisible = false
  @Binding var show : Bool
  @State var alert = false
  @State var error = ""

  //colore per la tab view
  @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
  //colore per la navigation view
  @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
  
  var body: some View{
      
      ZStack{
        navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
          
          ZStack(alignment: .topLeading) {
              
              GeometryReader{_ in
                  
                  VStack{
                      
                    Image("logo")
                      .resizable()
                      .scaledToFill()
                      .frame(width: 200, height: 200)
                      
                      Text("Login to your account")
                          .font(.title)
                          .fontWeight(.bold)
                          .foregroundColor(self.color)
                          .padding(.top, 35)
                      
                      TextField("Email", text: self.$email)
                      .autocapitalization(.none)
                      .padding()
                      .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                      .padding(.top, 25)
                      
                      HStack(spacing: 15){
                          
                          VStack{
                              
                              if self.visible{
                                  
                                  TextField("Password", text: self.$pass)
                                  .autocapitalization(.none)
                              }
                              else{
                                  
                                  SecureField("Password", text: self.$pass)
                                  .autocapitalization(.none)
                              }
                          }
                          
                          Button(action: {
                              
                              self.visible.toggle()
                              
                          }) {
                              
                              Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                  .foregroundColor(self.color)
                          }
                          
                      }
                      .padding()
                      .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
                      .padding(.top, 25)
                      
                      HStack(spacing: 15){
                          
                          VStack{
                              
                              if self.revisible{
                                  
                                  TextField("Re-enter", text: self.$repass)
                                  .autocapitalization(.none)
                              }
                              else{
                                  
                                  SecureField("Re-enter", text: self.$repass)
                                  .autocapitalization(.none)
                              }
                          }
                          
                          Button(action: {
                              
                              self.revisible.toggle()
                              
                          }) {
                              
                              Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                  .foregroundColor(self.color)
                          }
                          
                      }
                      .padding()
                      .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("Color") : self.color,lineWidth: 2))
                      .padding(.top, 25)
                      
                      Button(action: {
                          
                          self.register()
                      }) {
                          
                          Text("Register")
                              .foregroundColor(.black)
                              .padding(.vertical)
                              .frame(width: UIScreen.main.bounds.width - 50)
                      }
                      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                      .padding()
                      .foregroundColor(.black)
                      .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                      .cornerRadius(40)
                      .padding(.top, 25)
                      
                  }
                  .padding(.horizontal, 25)
              }
              
              Button(action: {
                  
                  self.show.toggle()
                  
              }) {
                  
                  Image(systemName: "chevron.left")
                      .font(.title)
                      .foregroundColor(Color("Color"))
              }
              .padding()
          }
          
          if self.alert{
              
              ErrorView(alert: self.$alert, error: self.$error)
          }
      }
      .navigationBarBackButtonHidden(true)
  }
  
  func register(){
      
      if self.email != ""{
          
          if self.pass == self.repass{
              
              Auth.auth().createUser(withEmail: self.email, password: self.pass) { (res, err) in
                  
                  if err != nil{
                      
                      self.error = err!.localizedDescription
                      self.alert.toggle()
                      return
                  }
                  
                  print("success")
                  
                  UserDefaults.standard.set(true, forKey: "status")
                  NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
              }
          }
          else{
              
              self.error = "Password mismatch"
              self.alert.toggle()
          }
      }
      else{
          
          self.error = "Please fill all the contents properly"
          self.alert.toggle()
      }
  }
}


struct ErrorView : View {
  
  @State var color = Color.black.opacity(0.7)
  @Binding var alert : Bool
  @Binding var error : String
  
  var body: some View{
      
      GeometryReader{_ in
          
          VStack{
              
              HStack{
                  
                  Text(self.error == "RESET" ? "Message" : "Error")
                      .font(.title)
                      .fontWeight(.bold)
                      .foregroundColor(self.color)
                  
                  Spacer()
              }
              .padding(.horizontal, 25)
              
              Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
              .foregroundColor(self.color)
              .padding(.top)
              .padding(.horizontal, 25)
              
              Button(action: {
                  
                  self.alert.toggle()
                  
              }) {
                  
                  Text(self.error == "RESET" ? "Ok" : "Cancel")
                    .foregroundColor(.black)
                      .padding(.vertical)
                      .frame(width: UIScreen.main.bounds.width - 120)
              }
              .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 30)
              .padding()
              .foregroundColor(.black)
              .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
              .cornerRadius(40)
              .padding(.top, 25)
              
          }
          .padding(.vertical, 120)
          .background(Color.white)
          .cornerRadius(15)
      }
      .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
  }
}
