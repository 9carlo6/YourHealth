//
//  ImagePickerController.swift
//  YourHealth
//
//  Created by conteangelo on 15/01/2021.
//

import SwiftUI

struct ImagePickerController: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    
    func listOfImageFile() {
        let storageReference = Storage.storage().reference().child("")
    }
}

struct ImagePickerController_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerController()
    }
}
