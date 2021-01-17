//
//  SpecialistRequestListView.swift
//  YourHealth
//
//  Created by pannullocarlo on 17/01/2021.
//

import SwiftUI

struct SpecialistRequestListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var specialists = [Specialist(image: "dottoressa1", name: "Giulia Giordano", role: "Psychologist"), Specialist(image: "dottore1", name: "Paolo Verdi", role: "Neuropsychologist"), Specialist(image: "images-1", name: "Saverio Rossi", role: "Psychiatrist"), Specialist(image: "images-2", name: "Cassandra Mora", role: "Psychotherapist"), Specialist(image: "images", name: "Debora Bruni", role: "Neuropsychologist"), Specialist(image: "Unknown-1", name: "Giuseppe Conti", role: "Psychologist"), Specialist(image: "Unknown", name: "Mauro Pirlo", role: "Psychotherapist")
    ]
    
    private var displayOrder = ["Alphabetical", "Show Favorite First"]
    
    @State private var selectedOrder = 0
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    var body: some View {
        ZStack{
            navColor.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    
                    Text("Assign the patient to one of the center's specialists")
                        .padding(.leading, 20)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 10)
                    List(){
                        ForEach(specialists){ specialist in
                                VStack(alignment: .leading){
                                    BasicSpecialist4(specialist: specialist)
                                    NavigationLink(destination: ProfileSpecialist4(specialist: specialist)){
                                    EmptyView()
                                }
                                .frame(width: 0)
                                .opacity(0)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            
                            .listRowInsets(EdgeInsets())
                            
                            .background(navColor.edgesIgnoringSafeArea(.all))
                        }
                        .listRowBackground(Color("LightPink"))
                    }
                }
                .frame(minWidth: 390, maxWidth: 390, minHeight: 680, maxHeight: 680 )
                .background(navColor.edgesIgnoringSafeArea(.all))
            
            }
            .navigationBarTitle("")
            .navigationBarItems(leading: Text("Our Specialists")
                                    .font(.largeTitle)
                                    .bold())
   }
    
}

struct SpecialistRequestListView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistRequestListView()
    }
}



struct ProfileSpecialist4: View {
    var specialist: Specialist
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    var body: some View {
        
        ZStack{
            navColor.edgesIgnoringSafeArea(.all)
            VStack{
                Image(specialist.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, alignment: .center)
                    .clipShape(Circle())
                    .padding()
                
                Text(specialist.name)
                    .fontWeight(.semibold)
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Text(specialist.role)
                    .bold()
                    .font(.system(.body))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
            
                Text("Specialized center Healt Care Center \n Via Salvator Rosa 13, Benevento")
                    .bold()
                    .font(.system(.body))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                        
                Spacer()
                
                HStack {
                    NavigationLink(destination: assignmentDoneView()){
                        Text("Choose this Specialist")
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
                .padding(.bottom, 30)
                    
            }
        }.padding(.top, -10)
    }
    
}


struct BasicSpecialist4: View {
    var specialist: Specialist
    //@State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    var body: some View {
        
        HStack{
            
            Image(specialist.image)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
                
            
            VStack (alignment: .leading){
                
                Text(specialist.name)
                
                Text(specialist.role)
            }
            

        }
    }
}


struct assignmentDoneView: View {
    
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    

    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            navColor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            //l'immagine poi deve essere scaricata dal database
            
            Image("mano")
                .resizable()
                .scaledToFill()
                .frame(width: 600.0, height: 250.0)
                .padding(.top, 100)
                .padding(.trailing, 50)
            
            VStack{
                VStack{
                    Text("The patient was assigned")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
                    Text(" ")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
                    
                    Text("Paolo Verdi will receive the notification shortly")
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 56/255, green: 55/255, blue: 64/255))
                    
                }
                .frame(minWidth: 0, maxWidth: 300)
                .padding(.top, 50.0)
                
                    Spacer()
                            
                HStack {
                    Button(action: {
                        
                    } )
                    {
                        Text("Return to Notification")
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
