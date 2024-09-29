//
//  CellBackgroundColorHelper.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 30.09.2024.
//

import UIKit.UIColor

/// Хелпер для получения цвета ячейки.
///
/// В ячейках на экране **WordListScreen** последовательно используются  цвета из **Color.WordListScreen.CellBackgroundColor**.
/// Хелпер помогает получить актуальный цвет по индексу.
final class CellBackgroundColorHelper {
    private static let colors: [UIColor] = Color.WordListScreen.CellBackgroundColor.allColors

    static func getColor(by index: Int) -> UIColor {
        let updatedIndex = index % colors.count
        return colors[updatedIndex]
    }
}
