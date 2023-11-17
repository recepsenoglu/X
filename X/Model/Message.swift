//
//  Message.swift
//  X
//
//  Created by Recep Oğuzhan Şenoğlu on 9.10.2023.
//

import Foundation

struct Message {
    var user: User
    var lastMessage: String
    var lastMessageAge: String
    
    init(user: User, lastMessage: String, lastMessageAge: String) {
        self.user = user
        self.lastMessage = lastMessage
        self.lastMessageAge = lastMessageAge
    }
}
