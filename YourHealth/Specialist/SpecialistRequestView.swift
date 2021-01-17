//
//  SpecialistRequestView.swift
//  YourHealth
//
//  Created by pannullocarlo on 16/01/2021.
//

import SwiftUI

struct SpecialistRequestView: View {
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    var body: some View {
        ZStack{
            navColor.edgesIgnoringSafeArea(.all)
            VStack{

                    
                Image("sara")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, alignment: .center)
                    .clipShape(Circle())
                    .padding()
                        
                    
                Text("Sara Marra")
                    .fontWeight(.semibold)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    
                Text("Benevento")
                    .bold()
                    .font(.system(.body))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding()
                    
                
                VStack(alignment: .leading, spacing: 40){
                    HStack{
                        Text("Age:")
                            .font(.system(.body))
                            .foregroundColor(.black)
                        Text("25")
                            .bold()
                            .font(.system(.body))
                            .foregroundColor(.black)
                    }
                    HStack{
                        Text("Themes:")
                            .font(.system(.body))
                            .foregroundColor(.black)
                        Text("Depression")
                            .bold()
                            .font(.system(.body))
                            .foregroundColor(.black)
                    }
                    HStack{
                        Text("Phone Number:")
                            .font(.system(.body))
                            .foregroundColor(.black)
                        Text("3442226152")
                            .bold()
                            .font(.system(.body))
                            .foregroundColor(.black)
                    }
                    HStack{
                        Text("Status:")
                            .font(.system(.body))
                            .foregroundColor(.black)
                        Text("Student")
                            .bold()
                            .font(.system(.body))
                            .foregroundColor(.black)
                    }
                    HStack(alignment: .top){
                        Text("Other Info:")
                            .font(.system(.body))
                            .foregroundColor(.black)
                        Text("I would rather be assigned to Paolo Verdi")
                            .bold()
                            .font(.system(.body))
                            .foregroundColor(.black)
                    }.frame(minHeight: 60)
                }.frame(maxWidth: 380)
                        
                
                Text("").frame(minHeight: 20, maxHeight: 20)
                
                HStack {
                    NavigationLink(destination: SpecialistRequestListView()){
                        Text("Assign the patient")
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
                .padding(.bottom, 40)
                
                    
            }.padding(.top, 30)

        
        }.navigationTitle("")
    }
}

struct SpecialistRequestView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialistRequestView()
    }
}
