//
//  LocalizedString.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 17.09.2024.
//

import Foundation

// swiftlint:disable nesting
enum LocalizedString {
    enum WordListScreen {
        enum NavigationBar {
            static let title: String = NSLocalizedString("WordListScene.NavigationBar.Title", comment: "")
        }
        enum AddWordButton {
            static let title: String = NSLocalizedString("WordListScene.AddWordButton.Title", comment: "")
        }
    }

    enum TestsScreen {
        static let title: String = NSLocalizedString("TestsTitle", comment: "")
    }

    enum ProfileScreen {
        static let title: String = NSLocalizedString("ProfileTitle", comment: "")
    }
}
// swiftlint:enable nesting
