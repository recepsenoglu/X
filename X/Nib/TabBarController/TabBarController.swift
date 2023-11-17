//
//  TabBarController.swift
//  X
//
//  Created by Recep Oğuzhan Şenoğlu on 17.11.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Outlets
    
    @IBOutlet private var customTabBarView: UIView!
    @IBOutlet private weak var homeButton: UIButton!
    @IBOutlet private weak var messagesButton: UIButton!
    
    // MARK: - Variables
    
    private var homeButtonImage: UIImage? = UIImage(systemName: "house")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    private var messagesButtonImage: UIImage? = UIImage(systemName: "envelope")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    private var homeButtonSelectedImage: UIImage? = UIImage(systemName: "house.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    private var messagesButtonSelectedImage: UIImage? = UIImage(systemName: "envelope.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCustomTabBarViewProgrammatically()
    }
    
    // MARK: - Functions
    
    private func addCustomTabBarViewProgrammatically() {
        view.addSubview(customTabBarView)
        customTabBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTabBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            customTabBarView.heightAnchor.constraint(equalToConstant: 100),
            customTabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    // MARK: - Actions
    
    @IBAction private func changeTab_TUI(_ sender: Any) {
        homeButton.setImage(homeButtonImage, for: .normal)
        messagesButton.setImage(messagesButtonImage, for: .normal)
        let index = (sender as! UIButton).tag
        switch index {
        case 0:
            homeButton.setImage(homeButtonSelectedImage, for: .normal)
        case 1:
            messagesButton.setImage(messagesButtonSelectedImage, for: .normal)
        default:
            homeButton.setImage(homeButtonSelectedImage, for: .normal)
        }
        selectedIndex = index
    }
    
}
