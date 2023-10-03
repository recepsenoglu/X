//
//  PostTVC.swift
//  X
//
//  Created by Recep Oğuzhan Şenoğlu on 3.10.2023.
//

import UIKit

class PostTVC: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak private var userImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var verifiedView: UIImageView!
    @IBOutlet weak private var usernameLabel: UILabel!
    @IBOutlet weak private var postAgeLabel: UILabel!
    @IBOutlet weak private var postTextLabel: UILabel!
    @IBOutlet weak private var postImageView: UIImageView!
    @IBOutlet weak private var commentsCountLabel: UILabel!
    @IBOutlet weak private var repostsCountLabel: UILabel!
    @IBOutlet weak private var likesCountLabel: UILabel!
    @IBOutlet weak private var viewsCountLabel: UILabel!
    
    // MARK: - Functions
    
    func setupCell(_ post: Post) {
        userImageView.image = post.user.image
        nameLabel.text = post.user.name
        verifiedView.isHidden = !post.user.isVerified
        usernameLabel.text = post.user.username
        postAgeLabel.text = post.postAge
        commentsCountLabel.text = post.commentsCount
        repostsCountLabel.text = post.repostsCount
        likesCountLabel.text = post.likesCount
        viewsCountLabel.text = post.viewsCount
        postTextLabel.text = post.text
        postImageView.image = post.image
    }
}
