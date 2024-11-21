//
//  ViewController.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 16.09.2024.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        let attributes: [NSAttributedString.Key: Any] = [.font: AppFont.title]
        navigationController?.navigationBar.largeTitleTextAttributes = attributes
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupView() {
        view.backgroundColor = AppColor.mainBackground
    }
}
