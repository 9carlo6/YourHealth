//
//  Types.swift
//  YourHealth
//
//  Created by pannullocarlo on 29/12/2020.
//


//questo file serve per gestire la parte di autenticazione
//qui verrà gestita anche la parte dove di divisione tra utente e specialista
import SwiftUI

class UserSettings {
    var isAuthenticated = false
    
    var autheticationString: String {
        if isAuthenticated {
            return "Authenticated"
        }else{
            return "Anonymous"
        }
    }
}

class AppSettings{
    var language = "English"
}
 
