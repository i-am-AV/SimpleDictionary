//
//  Label.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 29.09.2024.
//

import UIKit.UILabel

final class Label: UILabel {
    init(font: UIFont, textColor: UIColor) {
        super.init(frame: .zero)
        self.font = font
        self.textColor = textColor
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
