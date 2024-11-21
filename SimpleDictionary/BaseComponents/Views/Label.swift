//
//  Label.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 29.09.2024.
//

import UIKit.UILabel

final class Label: UILabel {
    init(_ defaultText: String? = nil, font: UIFont, textColor: UIColor, numberOfLines: Int = 1) {
        super.init(frame: .zero)
        self.text = defaultText
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
