//
//  User.swift
//  X
//
//  Created by Recep Oğuzhan Şenoğlu on 3.10.2023.
//

import Foundation
import UIKit

struct User {
    var image: UIImage
    var name: String
    var username: String
    var isVerified: Bool
    
    init(image: String, name: String, username: String, isVerified: Bool) {
        self.image = UIImage(named: image) ?? UIImage(systemName: "person")!
        self.name = name
        self.username = "@\(username)"
        self.isVerified = isVerified
    }
}
