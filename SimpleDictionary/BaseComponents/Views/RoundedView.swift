//
//  RoundedView.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 29.09.2024.
//

import UIKit.UIView

final class RoundedView: UIView {
    init(cornerRadius: CGFloat) {
        super.init(frame: .zero)
        layer.cornerRadius = cornerRadius
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
