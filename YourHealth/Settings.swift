//
//  Settings.swift
//  YourHealth
//
//  Created by conteangelo on 06/01/2021.
//

import SwiftUI

struct Settings: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    private var displayOrder = ["Alphabetical", "Show Favorite First"]
    
    @State private var selectedOrder = 0
    
    var body: some View {
        
        //ZStack{
            //navColor.edgesIgnoringSafeArea(.all)
            NavigationView{
             Form{
                 Section{
                     Text("Settings")
                         .font(.system(.largeTitle, design: .rounded))
                         .fontWeight(.black)
                         .bold()
                         .aspectRatio(contentMode: .fit)
                         
                 }
                 .listRowBackground(navColor)
                 
                 
                 Section{
                     Picker(selection: $selectedOrder, label: Text("Display order")) {
                         ForEach(0..<displayOrder.count, id: \.self) {
                             Text(self.displayOrder[$0])
                                
                         }
                     }
                     
                    
                     Picker(selection: $selectedOrder, label: Text("Display order")) {
                         ForEach(0..<displayOrder.count, id: \.self) {
                             Text(self.displayOrder[$0])
                         }
                     }
                     Picker(selection: $selectedOrder, label: Text("Display order")) {
                         ForEach(0..<displayOrder.count, id: \.self) {
                             Text(self.displayOrder[$0])
                         }
                     }
                     Picker(selection: $selectedOrder, label: Text("Display order")) {
                         ForEach(0..<displayOrder.count, id: \.self) {
                             Text(self.displayOrder[$0])
                         }
                     }
                     
                    
                 }
                 .listRowBackground(navColor)
                 
             }
             
             .navigationBarTitle("Settings")
             .background(navColor.edgesIgnoringSafeArea(.all))
            }
        //}
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
