//
//  SquareButtonWithImage.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 29.09.2024.
//

import UIKit.UIButton

final class RoundButton: UIButton {
    init(sideSize: CGFloat, image: UIImage?, backgroundColor: UIColor?) {
        super.init(frame: .zero)
        makeSquare(with: sideSize)
        layer.cornerRadius = sideSize / 2
        setImage(image, for: .normal)
        self.backgroundColor = backgroundColor
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
