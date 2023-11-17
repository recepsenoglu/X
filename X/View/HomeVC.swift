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
        Post(user: users[0], postAge: "2m", commentsCount: 4, repostsCount: 2, likesCount: 0, viewsCount: 666, text: "Hello X!", reposterame: "Elon Musk"),
        Post(user: users[1], postAge: "1h", commentsCount: 42, repostsCount: 12, likesCount: 389, viewsCount: 835, image: "AssalaPost"),
        Post(user: users[2], postAge: "4h", commentsCount: 1, repostsCount: 0, likesCount: 1, viewsCount: 10, text: "Did anyone see a guy with a trench-coat?"),
        Post(user: users[4], postAge: "1d", commentsCount: 121, repostsCount: 70, likesCount: 600, viewsCount: 1923, text: "The nevest member of the 7: Turklander!", image: "Homelander", reposterame: "Recep"),
        Post(user: users[3], postAge: "12h", commentsCount: 12, repostsCount: 4, likesCount: 45, viewsCount: 261, text: "I missed 2021..."),
        Post(user: users[5], postAge: "4d", commentsCount: 0, repostsCount: 0, likesCount: 1, viewsCount: 12, text: "Hey. Just signed up"),
        ])
    }
    
    private func getUsers() -> [User] {
        return [
        User(image: "recep", name: "Recep Senoglu", username: "eatsand", isVerified: true),
        User(image: "assala", name: "Assala Dhouioui", username: "pothead23", isVerified: true),
        User(image: "recep2", name: "Jon Smith", username: "root010101", isVerified: false),
        User(image: "recep3", name: "It's me again", username: "jesse.pinkman", isVerified: false),
        User(image: "vought", name: "Vought International", username: "vought", isVerified: true),
        User(image: "recep4", name: "Hozho", username: "hozho444", isVerified: false),
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
