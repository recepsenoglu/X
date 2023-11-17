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
            Message(user: users[0], lastMessage: "Message Text Message Text Message Text Message Text Message Text Message Text Message Text Message Text Message Text ", lastMessageAge: "1h"),
            Message(user: users[1], lastMessage: "Message Text Message Text Message Text Message Text Message Text Message Text Message Text Message Text Message Text ", lastMessageAge: "3d"),
            Message(user: users[2], lastMessage: "Message Text Message Text Message Text Message Text Message Text Message Text Message Text Message Text Message Text ", lastMessageAge: "1w"),
            Message(user: users[3], lastMessage: "Message Text Message Text Message Text Message Text Message Text Message Text Message Text Message Text Message Text ", lastMessageAge: "4h")
        ])
        filteredMessages.append(contentsOf: messages)
    }
    
    private func getUsers() -> [User] {
        return [
        User(image: "user1", name: "John Locke", username: "jondoe34", isVerified: false),
        User(image: "user2", name: "Harry Marbles", username: "harryMrbls.1", isVerified: true),
        User(image: "user3", name: "Jack Smitheren", username: "smithJac44445678", isVerified: true),
        User(image: "user4", name: "Aiden Xerath", username: "aio0031", isVerified: false),
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
