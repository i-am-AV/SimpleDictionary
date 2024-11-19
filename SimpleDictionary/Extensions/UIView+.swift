//
//  UIView+.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 26.09.2024.
//

import UIKit.UIView

extension UIView {
    enum Side {
        case top(CGFloat = .zero)
        case bottom(CGFloat = .zero)
        case leading(CGFloat = .zero)
        case trailing(CGFloat = .zero)
    }

    func prepareForAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    func makeSquare(with sideSize: CGFloat) {
        setHeightAnchor(sideSize)
        setWidthAnchor(sideSize)
    }

    func setHeightAnchor(_ constant: CGFloat) {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func setWidthAnchor(_ constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
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

    func pinToSafeAreaSuperview(sides: [Side]) {
        guard let superview else {
            assertionFailure("\(Self.self) must have a superview")
            return
        }

        for side in sides {
            switch side {
            case .top(let constant):
                topAnchor.constraint(
                    equalTo: superview.safeAreaLayoutGuide.topAnchor,
                    constant: constant
                ).isActive = true
            case .bottom(let constant):
                bottomAnchor.constraint(
                    equalTo: superview.safeAreaLayoutGuide.bottomAnchor,
                    constant: constant
                ).isActive = true
            case .leading(let constant):
                leadingAnchor.constraint(
                    equalTo: superview.safeAreaLayoutGuide.leadingAnchor,
                    constant: constant
                ).isActive = true
            case .trailing(let constant):
                trailingAnchor.constraint(
                    equalTo: superview.safeAreaLayoutGuide.trailingAnchor,
                    constant: constant
                ).isActive = true
            }
        }
    }

    func pinToSuperview() {
        pinToSuperview(sides: [.top(), .bottom(), .leading(), .trailing()])
    }

    func pinToSuperview(sides: [Side]) {
        guard let superview else {
            assertionFailure("\(Self.self) must have a superview")
            return
        }

        for side in sides {
            switch side {
            case .top(let constant):
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .bottom(let constant):
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: constant).isActive = true
            case .leading(let constant):
                leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant).isActive = true
            case .trailing(let constant):
                trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: constant).isActive = true
            }
        }
    }

    func pinToSuperview(excluding side: Side) {
        switch side {
        case .top:
            pinToSuperview(sides: [.bottom(), .leading(), .trailing()])
        case .bottom:
            pinToSuperview(sides: [.top(), .leading(), .trailing()])
        case .leading:
            pinToSuperview(sides: [.top(), .bottom(), .trailing()])
        case .trailing:
            pinToSuperview(sides: [.top(), .bottom(), .leading()])
        }
    }
}
