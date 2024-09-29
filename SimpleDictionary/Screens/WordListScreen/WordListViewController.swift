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
        DataSource(vocabula: "application", translation: "приложение", transcription: "[æplɪˈkeɪʃn]")
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

        tableView.register(
            WordListTableViewCell.self,
            forCellReuseIdentifier: WordListTableViewCell.reuseIdentifier
        )
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

        configCell(cell, using: dataSource[indexPath.row])

        return cell
    }

    #warning("Вместо randomElement написать helper")
    private func configCell(_ cell: WordListTableViewCell, using dataSource: DataSource) {
        cell.configCell(
            using: WordListTableViewCell.Model(
                vocabula: dataSource.vocabula,
                translation: dataSource.translation,
                transcription: dataSource.transcription,
                backgroundColor: Array([
                    Color.WordListScreen.Cell.backgroundPurple,
                    Color.WordListScreen.Cell.backgroundGreen,
                    Color.WordListScreen.Cell.backgroundMagenta,
                    Color.WordListScreen.Cell.backgroundBlue,
                    Color.WordListScreen.Cell.backgroundPink
                ]).randomElement() ?? .systemOrange
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
