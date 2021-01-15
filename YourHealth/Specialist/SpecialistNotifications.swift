//
//  SpecialistNotifications.swift
//  YourHealth
//
//  Created by pannullocarlo on 15/01/2021.
//

import SwiftUI

struct SpecialistNotifications: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var specialists = [Specialist(image: "logo", name: "YourHealth", role: "You have a new request from..."), Specialist(image: "giovanni", name: "Giovanni Muciaccia", role: "Call me to book an appointment...")
    ]
    
    @State private var selectedOrder = 0
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    var body: some View {
        ZStack{
                VStack(alignment: .leading){
                    List(){
                        ForEach(specialists){ specialist in
                                VStack(alignment: .leading){
                                    BasicSpecialist2(specialist: specialist)
                                    NavigationLink(destination: ProfileSpecialist(specialist: specialist)){
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
                .background(navColor.edgesIgnoringSafeArea(.all))
            }
        
   }
    
}

struct BasicSpecialist2: View {
    var specialist: Specialist
    
    var body: some View {
        
        HStack{
            Image(specialist.image)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(25)
            
            VStack (alignment: .leading){
                Text(specialist.name)
                Text(specialist.role).foregroundColor(.gray)
            }
            Spacer()
            Image("spunte3")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
        }  
    }
}

struct SpecialistNotifications_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistNotifications()
    }
}
