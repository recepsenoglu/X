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
    @IBOutlet weak private var repostedLabel: UILabel!
    @IBOutlet weak private var repostImageView: UIImageView!
    
    // MARK: - Functions
    
    func setupCell(_ post: Post) {
        userImageView.image = post.user.image
        nameLabel.text = post.user.name
        verifiedView.isHidden = !post.user.isVerified
        usernameLabel.text = post.user.username
        postAgeLabel.text = " ·\(post.postAge)"
        commentsCountLabel.text = post.commentsCount
        repostsCountLabel.text = post.repostsCount
        likesCountLabel.text = post.likesCount
        viewsCountLabel.text = post.viewsCount
        if post.hasText {
            postTextLabel.text = post.text
        } else {
            postTextLabel.isHidden = true
        }
        if post.hasImage {
            postImageView.image = post.image
            NSLayoutConstraint.activate([
                postImageView.heightAnchor.constraint(equalToConstant: 300)
            ])
        } else {
            postImageView.isHidden = true
        }
        if post.hasReposter {
            repostedLabel.text = "\(post.reposterName!) reposted"
        } else { 
            repostImageView.isHidden = true
            repostedLabel.isHidden = true
        }
    }
}
