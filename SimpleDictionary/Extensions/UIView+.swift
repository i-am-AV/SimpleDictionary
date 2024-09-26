//
//  UIView+.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 26.09.2024.
//

import UIKit

extension UIView {
    func prepareForAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    func pinToSafeAreaSuperview() {
        guard let superview else {
            assertionFailure("\(Self.self) must have a superview")
            return
        }
        NSLayoutConstraint.activate(
            [
                topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor),
                bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor),
                leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor)
            ]
        )
    }
}
