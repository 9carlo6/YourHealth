//
//  UserDashboard.swift
//  YourHealth
//
//  Created by pannullocarlo on 11/01/2021.
//

import SwiftUI

struct UserDashboard: View {
    //colore per la tab view
    @State var tabColor: UIColor = UIColor.init(red: 255/255, green: 226/255, blue: 226/255,alpha: 0.0)
    //colore per la navigation view
    @State var navColor: Color = Color.init(red: 255/255, green: 240/255, blue: 240/255)
    //colore per la navigation view versione UI
    @State var navColorUI: UIColor = UIColor.init(red: 255/255, green: 240/255, blue: 240/255,alpha: 0.0)
    //string per form
    @State private var city = ""
    
    //per tornare indietro
    @Environment(\.presentationMode) var presentationMode
    
    let cities = ["Benevento", "Airola", "Roma", "Firenze", "Torino", "Napoli", "Palermo"]
    
    @State private var searchText : String = ""
    
    var body: some View {
        VStack {
            
            SearchBar(text: $searchText, placeholder: "Enter the name of the city where you are")
            List {
                ForEach(self.cities.filter {
                    self.searchText.isEmpty ? true : $0.lowercased().contains(self.searchText.lowercased())
                }, id: \.self) { city in
                    Button(action:{
                        //bisogna mettere la view relativa al centro
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text(city)
                    }
                }.listRowBackground(navColor)
            }
            
        }
    }
}

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct UserDashboard_Previews: PreviewProvider {
    static var previews: some View {
        UserDashboard()
    }
}
