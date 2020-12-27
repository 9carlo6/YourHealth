//
//  JoinCenterView.swift
//  YourHealth
//
//  Created by pannullocarlo on 27/12/2020.
//

import SwiftUI

struct JoinCenterView: View {
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //string per form
    @State private var code = ""
    
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
                        Section(header: Text("Enter the code you recived")
                                    .fontWeight(.light)
                                    .font(.headline)
                                    .foregroundColor(.black)){
                            TextField("Code", text: $code)
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
                    .navigationBarItems(leading: Text("Join a center")
                                            .font(.largeTitle)
                                            .bold())
                    
                    
                }
            }
        }
    }
    
}

struct JoinCenterView_Previews: PreviewProvider {
    static var previews: some View {
        JoinCenterView()
    }
}
