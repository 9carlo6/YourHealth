//
//  Login.swift
//  YourHealth
//
//  Created by pannullocarlo on 07/01/2021.
//

import SwiftUI

struct Login: View {
    
    @EnvironmentObject var session: SessionStore
    

    func getUser () {
          session.listen()
      }
    
    var body: some View {
        Group {
              if (session.session != nil) {
                
                ContentView().onAppear(perform: getUser)
              } else {
                SignInView()
                
              }
            }.onAppear(perform: getUser)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environmentObject(SessionStore())
    }
}
