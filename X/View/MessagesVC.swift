//
//  MessagesVC.swift
//  X
//
//  Created by Recep Oğuzhan Şenoğlu on 9.10.2023.
//

import UIKit

final class MessagesVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var messagesTV: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Variables
    
    private var messages = [Message]()
    private var filteredMessages = [Message]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMessages()
        searchBar.backgroundImage = UIImage()
    }
    
    // MARK: - Functions
    
    func loadMessages() {
        let users = getUsers()
        messages.append(contentsOf: [
            Message(user: users[0], lastMessage: "Başarılarının devamını dilerim kardeşim. Hadi allaha emanet ol", lastMessageAge: "1h"),
            Message(user: users[1], lastMessage: "So, what do you think about it?\n", lastMessageAge: "3h"),
            Message(user: users[2], lastMessage: "Thank you :)\n", lastMessageAge: "1d"),
            Message(user: users[3], lastMessage: "really good song btw\n", lastMessageAge: "3d"),
            Message(user: users[4], lastMessage: "buy crypto coins\n", lastMessageAge: "1w")
        ])
        filteredMessages.append(contentsOf: messages)
    }
    
    private func getUsers() -> [User] {
        return [
        User(image: "noname", name: "Name cannot be blanked", username: "recSkywalker", isVerified: false),
        User(image: "Homelander", name: "ex Homelander", username: "homelander", isVerified: true),
        User(image: "assala", name: "Assala", username: "assala23", isVerified: true),
        User(image: "recep3", name: "New person", username: "sameOldMistakes", isVerified: false),
        User(image: "doge", name: "Doge", username: "doge", isVerified: true)
        ]
    }
}

extension MessagesVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty { filteredMessages = messages }
        else {
            filteredMessages = messages.filter({
                (message: Message) -> Bool in
                let nameMatch = message.user.name.range(of: searchText, options: .caseInsensitive)
                let usernameMatch = message.user.username.range(of: searchText, options: .caseInsensitive)
                let lastMessageMatch = message.lastMessage.range(of: searchText, options: .caseInsensitive)
                return nameMatch != nil || usernameMatch != nil || lastMessageMatch != nil
            })
        }
        messagesTV.reloadData()
    }
}

extension MessagesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { filteredMessages.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MessageTVC", owner: self)!.first as! MessageTVC
        cell.setup(filteredMessages[indexPath.row])
        return cell
    }
}
