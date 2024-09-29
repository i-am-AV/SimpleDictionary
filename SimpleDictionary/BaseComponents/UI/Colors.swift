//
//  Colors.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 26.09.2024.
//

import UIKit.UIColor

// swiftlint:disable nesting
enum Color {
    enum WordListScreen {
        enum Cell {
            /// Цвет текста для вокабулы
            static let title: UIColor = .black
            /// Цвет текста для перевода
            static let subtitle: UIColor = .white
            /// Цвет текста для транскрипции
            static let subtitle2: UIColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        }
        enum CellBackgroundColor {
            static let backgroundPurple: UIColor = UIColor(red: 0.5, green: 0, blue: 1, alpha: 1)
            static let backgroundGreen: UIColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
            static let backgroundMagenta: UIColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
            static let backgroundBlue: UIColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.75)
            static let backgroundPink: UIColor = UIColor(red: 1, green: 0, blue: 0.5, alpha: 1)

            static let allColors: [UIColor] = [
                backgroundPurple, backgroundGreen, backgroundMagenta, backgroundBlue, backgroundPink
            ]
        }
    }
}
// swiftlint:enable nesting
