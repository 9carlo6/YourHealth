//
//  User.swift
//  YourHealth
//
//  Created by pannullocarlo on 07/01/2021.
//

class User {
    var uid: String
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }

}
