//
//  Fonts.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 26.09.2024.
//

import UIKit.UIFont

enum AppFont {
    // NavigationBar
    static let title = UIFont.systemFont(ofSize: 34, weight: .bold, width: .expanded)
    // Cells
    static let cellTitle = UIFont.systemFont(ofSize: 18, weight: .medium, width: .expanded)
    static let cellSubtitle = UIFont.systemFont(ofSize: 12, weight: .regular, width: .expanded)
    static let cellSubtitle2 = UIFont.systemFont(ofSize: 20, weight: .regular, width: .condensed)
    // Buttons
    static let buttonTitle = UIFont.systemFont(ofSize: 25, weight: .medium)
    static let buttonTitleSmall = UIFont.systemFont(ofSize: 20, weight: .medium)
    // TextFields
    static let inputText = UIFont.systemFont(ofSize: 34, weight: .medium, width: .expanded)
    static let inputText2 = UIFont.systemFont(ofSize: 34, weight: .regular, width: .expanded)
    static let inputText3 = UIFont.systemFont(ofSize: 34, weight: .regular, width: .condensed)
}
