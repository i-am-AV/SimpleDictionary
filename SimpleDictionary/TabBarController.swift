//
//  TabBarController.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 16.09.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupControllers()
    }

    // MARK: - Private methods

    private func setupTabBar() {
        tabBar.tintColor = .black
    }
    
    private func setupControllers() {
        let wordListNavigationController = UINavigationController(
            rootViewController: WordListViewController()
        )
        #warning("Локализовать строку")
        wordListNavigationController.config(with: "Словарь", and: .checkmark)
        
        let testsNavigationController = UINavigationController(
            rootViewController: TestsViewController()
        )
        #warning("Локализовать строку")
        testsNavigationController.config(with: "Тесты", and: .checkmark)
        
        let profileNavigationController = UINavigationController(
            rootViewController: ProfileViewController()
        )
        #warning("Локализовать строку")
        profileNavigationController.config(with: "Профиль", and: .checkmark)
        
        viewControllers = [
            wordListNavigationController,
            testsNavigationController,
            profileNavigationController
        ]
    }
}

private extension UINavigationController {
    func config(with title: String, and image: UIImage) {
        guard
            let rootViewController = viewControllers.first
        else {
            assertionFailure("No root controller has been assigned ")
            return
        }
        rootViewController.title = title
        tabBarItem.image = image
    }
}
