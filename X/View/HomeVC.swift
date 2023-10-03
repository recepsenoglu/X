//
//  ViewController.swift
//  X
//
//  Created by Recep Oğuzhan Şenoğlu on 22.09.2023.
//

import UIKit

final class HomeVC: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak private var postsTV: UITableView!
    
    // MARK: - Variables
    
    private var posts = [Post]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosts()
    }
    
    // MARK: - Functions
    
    private func loadPosts() {
        let users = getUsers()
        posts.append(contentsOf: [
        Post(user: users[0], postAge: "1m", commentsCount: 4, repostsCount: 0, likesCount: 1, viewsCount: 42, text: "Hello World!"),
        Post(user: users[1], postAge: "25m", commentsCount: 12, repostsCount: 2, likesCount: 82, viewsCount: 243, text: "Check out my new profile picture!", image: "user2"),
        Post(user: users[2], postAge: "1d", commentsCount: 420, repostsCount: 23, likesCount: 2543, viewsCount: 9683, image: "user3"),
        Post(user: users[3], postAge: "3h", commentsCount: 114, repostsCount: 8, likesCount: 1345, viewsCount: 4765, text: "Welcome to the league of legends champion spotlight. Featuring: Ashe, The Frost Archer!")
        ])
    }
    
    private func getUsers() -> [User] {
        return [
        User(image: "user1", name: "John Locke", username: "jondoe34", isVerified: false),
        User(image: "user2", name: "Harry Marbles", username: "harryMrbls.1", isVerified: true),
        User(image: "user3", name: "Jack Smitheren", username: "smithJac44444", isVerified: true),
        User(image: "user4", name: "Aiden Xerath", username: "aio0031", isVerified: false),
        ]
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = Bundle.main.loadNibNamed("PostTVC", owner: self)?.first as! PostTVC
        cell.setupCell(post)
        return cell
    }
    
    
}
