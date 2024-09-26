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
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupView() {
        view.backgroundColor = .systemBackground
    }
}
