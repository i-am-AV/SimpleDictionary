//
//  SceneDelegate.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 15.09.2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setWindow(using: windowScene)
    }

    private func setWindow(using windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = TabBarController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
