//
//  Images.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 28.09.2024.
//

import UIKit.UIImage

// swiftlint:disable nesting
enum Image {
    enum WordListScreen {
        enum Cell {
            static let play: UIImage = UIImage(named: "play") ?? UIImage()
            static let plus: UIImage = UIImage(named: "plus") ?? UIImage()
        }
    }
}
// swiftlint:enable nesting
