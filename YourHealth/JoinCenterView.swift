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
    
    var body: some View {
        
        NavigationView{
            ZStack{
                navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                //Text("You are in Dashboard")
                Form {
                    Section(header: Text("Enter the code you recived")
                                .fontWeight(.light)
                                .font(.headline)
                                .foregroundColor(.black)){
                        TextField("Code", text: $code)
                    }
                    
                }
                .background(navColor)
                
                
                    
                //parte bottoni
                VStack {
                    
                            Button(action: {
                                print("join tapped!")
                            }) {
                                HStack {
                                    Text("Submit")
                                        .fontWeight(.semibold)
                                        .font(.title)
                                }
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                                .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(40)
                                .padding(.horizontal, 20)
                            }
                 
                 
                }
                .padding(.top, 400)
                    
                //fine parte bottoni
                
                
                
                    .navigationBarTitle("")
                    .navigationBarItems(leading: Text("Join a center")
                                            .font(.largeTitle)
                                            .bold()
                    )
            }
        }
        
        
    }
}

struct JoinCenterView_Previews: PreviewProvider {
    static var previews: some View {
        JoinCenterView()
    }
}
