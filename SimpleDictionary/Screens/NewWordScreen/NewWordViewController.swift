//
//  NewWordViewController.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 08.10.2024.
//

import UIKit

final class NewWordViewController: ViewController {
    private let addingWordView = AddingWordView().prepareForAutoLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension NewWordViewController {
    func setupView() {
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        view.addSubview(addingWordView)
    }

    func makeConstraints() {
        addingWordView.pinToSuperview()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController
    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            NewWordViewController()
        }
    }
}
#endif
