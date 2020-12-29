//
//  CreateNewCenter.swift
//  YourHealth
//
//  Created by pannullocarlo on 29/12/2020.
//

import SwiftUI

struct CreateNewCenter: View {
    
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //string per form
    @State private var centerName = ""
    @State private var centerEmail = ""
    @State private var centerWebSite = ""
    @State private var centerPhone = ""
    
    //per nascondere il bottone di ritorno
    @State var navigationBarBackButtonHidden = true
    
    var body: some View {
        ZStack{
            //per il colore di background di tutta la view
            navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            /*
            //Per nascondere il bottone di ritorno
            Button("Show back") {
                        self.navigationBarBackButtonHidden = false
                    }.navigationBarBackButtonHidden(navigationBarBackButtonHidden)
            */
            NavigationView{
                ZStack{
                    //per il colore di background di dello ZStack
                    navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Form {
                        Section(header: Text("Center Name")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Name", text: $centerName)
                        }
                        Section(header: Text("Center Email")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Email", text: $centerEmail)
                        }
                        Section(header: Text("Center Website")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Website", text: $centerWebSite)
                        }
                        Section(header: Text("Center Phone")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Phone", text: $centerPhone)
                        }
                    }
                     
                    //parte bottoni
                    VStack {
                        HStack {
                            NavigationLink(destination: ContentView()) {
                            Text("Submit")
                                .fontWeight(.semibold)
                                .font(.title)
                            }
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
                    .navigationBarItems(leading: Text("Create New Center")
                                            .font(.largeTitle)
                                            .bold())
                    }
            }
        }
    }
}

struct CreateNewCenter_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewCenter()
    }
}
