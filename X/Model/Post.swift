//
//  PostModel.swift
//  X
//
//  Created by Recep Oğuzhan Şenoğlu on 3.10.2023.
//

import Foundation
import UIKit

struct Post {
    var user: User
    var postAge: String
    var commentsCount: String
    var repostsCount: String
    var likesCount: String
    var viewsCount: String
    var text: String?
    var image: UIImage?
    
    var hasText: Bool { get { text != nil }}
    var hasImage: Bool { get { image != nil }}
    
    init(user: User, postAge: String, commentsCount: Int, repostsCount: Int, likesCount: Int, viewsCount: Int, text: String? = nil, image: String? = nil) {
        self.user = user
        self.postAge = postAge
        self.commentsCount = String(commentsCount)
        self.repostsCount = String(repostsCount)
        self.likesCount = String(likesCount)
        self.viewsCount = String(viewsCount)
        self.text = text
        self.image = image != nil ? UIImage(named: image!) ?? nil : nil
    }
}
