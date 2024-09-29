//
//  WordListViewController.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 15.09.2024.
//

import UIKit

final class WordListViewController: ViewController {
    // MARK: - Private nested types

    private enum Constant {
        enum AddWordButton {
            static let cornerRadius: CGFloat = 24
        }
    }

    private enum Layout {
        enum AddWordButton {
            static let bottomAnchor: CGFloat = 30
            static let verticalSpacings: CGFloat = 12
            static let horizontalSpacings: CGFloat = 48
        }
    }

    // MARK: - Private UI properties

    private let tableView = UITableView().prepareForAutoLayout()

    private let addWordButton: UIButton = {
        let button = UIButton().prepareForAutoLayout()
        button.setTitle(LocalizedString.WordListScreen.AddWordButton.title, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = Constant.AddWordButton.cornerRadius
        button.tintColor = .white
        button.titleLabel?.font = Font.WordListScreen.AddButton.title

        return button
    }()

    // MARK: - Private properties

    private struct DataSource {
        let vocabula: String
        let translation: String
        let transcription: String
    }

    private let dataSource: [DataSource] = [
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]"),
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]"),
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]"),
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]"),
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]"),
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]"),
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]"),
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]"),
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]"),
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]")
    ]

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupTableView()
        setupActions()
    }
}

// MARK: - Private methods

private extension WordListViewController {
    func setupNavigationBar() {
        title = LocalizedString.WordListScreen.NavigationBar.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupView() {
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(addWordButton)
    }

    func makeConstraints() {
        tableView.pinToSuperview()

        addWordButton.pinToSafeAreaSuperview(sides: [.bottom(-Layout.AddWordButton.bottomAnchor)])
        addWordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addWordButton.setHeightAnchor(addWordButton.intrinsicContentSize.height + Layout.AddWordButton.verticalSpacings)
        addWordButton.setWidthAnchor(addWordButton.intrinsicContentSize.width + Layout.AddWordButton.horizontalSpacings)
    }

    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(
            WordListTableViewCell.self,
            forCellReuseIdentifier: WordListTableViewCell.reuseIdentifier
        )
    }

    func setupActions() {
        let action = UIAction { [weak self] _ in
            let viewController = UIViewController()
            viewController.view.backgroundColor = .red
            self?.present(viewController, animated: true)
        }
        addWordButton.addAction(action, for: .touchUpInside)
    }
}

// MARK: - UITableViewDataSource && UITableViewDelegate

extension WordListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: WordListTableViewCell.reuseIdentifier,
                for: indexPath
            ) as? WordListTableViewCell
        else {
            return UITableViewCell()
        }

        configCell(cell, using: dataSource[indexPath.row], and: indexPath.row)

        return cell
    }

    private func configCell(_ cell: WordListTableViewCell, using dataSource: DataSource, and index: Int) {
        cell.configCell(
            using: WordListTableViewCell.Model(
                vocabula: dataSource.vocabula,
                translation: dataSource.translation,
                transcription: dataSource.transcription,
                backgroundColor: CellBackgroundColorHelper.getColor(by: index)
            )
        )

        cell.play = {
            print(#function)
        }

        cell.add = {
            print(#function)
        }
    }
}
