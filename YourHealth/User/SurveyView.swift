//
//  SurveyView.swift
//  YourHealth
//
//  Created by pannullocarlo on 12/01/2021.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct SurveyView: View {
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    
    var themes = ["Other", "Anxiety", "Depression", "Panic", "Relationship Problems"]
    @State private var selectedThemesIndex = 0
    
    var statuses = ["Other", "Student", "Married", "Single"]
    @State private var selectedStatusesIndex = 0
    
    @State private var userAge = ""
    @State private var otherInfo = ""
    @State private var userPhone = ""
    
    @Binding var rootIsActive2 : Bool

    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            //l'immagine poi deve essere scaricata dal database
            VStack{
                Form {
                    
                    Section(header: Text("Insert your Age")
                                .fontWeight(.light)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.leading, 5))
                    {
                        TextField("Age", text: $userAge)
                        
                    }
                    
                    Section(header: Text("What theme you want to talk about?")
                                .fontWeight(.light)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.leading, 5))
                    {
                        Picker(selection: $selectedStatusesIndex, label: Text("Themes")) {
                            ForEach(0 ..< statuses.count) {
                                Text(self.statuses[$0])
                            }
                        }
                    }
                    
                    Section(header: Text("Insert your phone Number")
                                .fontWeight(.light)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.leading, 5))
                    {
                        TextField("Phone Number", text: $userPhone)
                        
                    }
                    
                    Section(header: Text("what's your status?")
                                .fontWeight(.light)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.leading, 5))
                    {
                        Picker(selection: $selectedThemesIndex, label: Text("Status")) {
                            ForEach(0 ..< themes.count) {
                                Text(self.themes[$0])
                            }
                        }
                    }
                    
                    Section(header: Text("Other Info (Optional)")
                                .fontWeight(.light)
                                .font(.headline)
                                .foregroundColor(.black)
                                
                                .padding(.leading, 5))
                    {
                        TextField("Other Info", text: $otherInfo)
                            .padding(.bottom, 35)
                            .frame(width: 332, height: 70, alignment: .center)
                        
                    }
                }.onAppear {
                    UITableView.appearance().backgroundColor = navColorUI
                 }
            
                HStack {
                    NavigationLink(destination: SurveySendView(shouldPopToRootView: self.$rootIsActive2)) {
                        Text("Send")
                            .fontWeight(.semibold)
                            .font(.title2)
                    }
                    .isDetailLink(false)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.black)
                .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .padding(.horizontal, 20)
                
                //fine parte bottoni
            }.padding(.bottom)
            .padding(.top)
            
        }
        .onAppear{
            if(rootIsActive2==false){
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarTitle("")
        .navigationBarItems(leading: Text("Questionnaire")
                                .font(.largeTitle)
                                .bold())
        
    }
}


struct SurveySendView: View {
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    

    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var shouldPopToRootView : Bool
    
    var body: some View {
        ZStack{
            navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            //l'immagine poi deve essere scaricata dal database
            
            Image("mano")
                .resizable()
                .scaledToFill()
                .frame(width: 600.0, height: 250.0)
                .padding(.top, 150)
                .padding(.trailing, 50)
            
            VStack{
                VStack{
                    Text("Your questionnaire has been sent")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
                    Text(" ")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
                    
                    Text("A specialist from the center will \n get back to you within 24 hours")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
                    
                }
                .frame(minWidth: 0, maxWidth: 300)
                .padding(.top, 100.0)
                
                    Spacer()
                            
                HStack {
                    Button(action: {
                        self.shouldPopToRootView = false
                        self.presentationMode.wrappedValue.dismiss()
                        
                    } )
                    {
                        Text("Return to Dashboard")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: 350)
                .padding()
                .foregroundColor(.black)
                .background(LinearGradient(gradient: Gradient(colors: [Color("Darkpink"), Color("Lightpink")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .padding(.horizontal, 20)
                
                //fine parte bottoni
            }.padding(.bottom)
            .padding(.top)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

}


