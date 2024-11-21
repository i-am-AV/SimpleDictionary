//
//  Colors.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 26.09.2024.
//

import UIKit.UIColor

/// Цвета всего приложения
enum AppColor {
    static let black = UIColor.black
    static let blue = UIColor(red: 0, green: 0, blue: 1, alpha: 0.75)
    static let green = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
    static let grayText = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
    static let magenta = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
    static let mainBackground = UIColor.systemBackground
    static let pink = UIColor(red: 1, green: 0, blue: 0.5, alpha: 1)
    static let placeholderText = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
    static let purple = UIColor(red: 0.5, green: 0, blue: 1, alpha: 1)
    static let white = UIColor.white
}

extension AppColor {
    static let backgroundColors: [UIColor] = [
        purple,
        green,
        magenta,
        blue,
        pink
    ]
}
