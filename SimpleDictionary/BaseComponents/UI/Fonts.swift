//
//  Fonts.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 26.09.2024.
//

import UIKit.UIFont

// swiftlint:disable nesting
enum Font {
    enum WordListScreen {
        enum Cell {
            /// Шрифт для вокабулы
            static let title: UIFont = UIFont.systemFont(ofSize: 18, weight: .medium, width: .expanded)
            /// Шрифт для перевода
            static let subtitle: UIFont = UIFont.systemFont(ofSize: 20, weight: .regular, width: .condensed)
            /// Шрифт для транскрипции
            static let subtitle2: UIFont = UIFont.systemFont(ofSize: 12, weight: .regular, width: .standard)
        }
        enum AddButton {
            static let title: UIFont = UIFont.systemFont(ofSize: 20, weight: .medium, width: .standard)
        }
    }
}
// swiftlint:enable nesting
