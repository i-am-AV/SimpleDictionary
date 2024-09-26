//
//  WordListViewController.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 15.09.2024.
//

import UIKit

final class WordListViewController: ViewController {
    // MARK: - Private UI properties

    private let tableView = UITableView().prepareForAutoLayout()

    // MARK: - Private properties

    private let cellIdentifier: String = "Cell"
    private let dataSource: [String] = [
        "app", "application", "mobile", "iOS", "swift",
        "app", "application", "mobile", "iOS", "swift",
        "app", "application", "mobile", "iOS", "swift",
        "app", "application", "mobile", "iOS", "swift"
    ]

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupTableView()
    }
}

// MARK: - Private methods

private extension WordListViewController {
    func setupNavigationBar() {
        title = LocalizedString.WordListScreen.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupView() {
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        view.addSubview(tableView)
    }

    func makeConstraints() {
        tableView.pinToSafeAreaSuperview()
    }

    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - UITableViewDataSource && UITableViewDelegate

extension WordListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]

        return cell
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
#endif

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            UINavigationController(rootViewController: WordListViewController())
        }
    }
}
