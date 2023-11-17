//
//  MessageTVC.swift
//  X
//
//  Created by Recep Oğuzhan Şenoğlu on 9.10.2023.
//

import UIKit

class MessageTVC: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var verifiedImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postAgeLabel: UILabel!
    

    // MARK: - Functions
    
    func setup(_ message: Message) {
        let user = message.user
        userImageView.image = user.image
        messageLabel.text = message.lastMessage
        nameLabel.text = user.name
        usernameLabel.text = user.username
        postAgeLabel.text = "·\(message.lastMessageAge)"
        verifiedImageView.isHidden = !user.isVerified
    }
}
