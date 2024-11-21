//
//  WordListTableViewCell.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 26.09.2024.
//

import UIKit

final class WordListTableViewCell: UITableViewCell {
    // MARK: - Typealiases
    typealias Action = (() -> Void)

    // MARK: - Static properties
    static var reuseIdentifier: String { "\(Self.self)" }

    // MARK: - Callbacks

    var play: Action?
    var add: Action?

    // MARK: - Model

    struct Model {
        let vocabula: String
        let translation: String
        let transcription: String
        let backgroundColor: UIColor
    }

    // MARK: - Private nested types
    // swiftlint:disable nesting
    private enum Constant {
        enum RoundedBackgroundView {
            static let cornerRadius: CGFloat = 20
        }
        enum Button {
            static let sideSize: CGFloat = 40
        }
    }
    // swiftlint:enable nesting

    // MARK: - Private UI properties

    private let roundedBackgroundView = RoundedView(
        cornerRadius: Constant.RoundedBackgroundView.cornerRadius
    ).prepareForAutoLayout()

    private let vocabulaLabel = Label(
        font: Font.WordListScreen.Cell.title,
        textColor: AppColor.black
    ).prepareForAutoLayout()

    private let translationLabel = Label(
        font: Font.WordListScreen.Cell.subtitle,
        textColor: AppColor.white
    ).prepareForAutoLayout()

    private let transcriptionLabel = Label(
        font: Font.WordListScreen.Cell.subtitle2,
        textColor: AppColor.grayText
    ).prepareForAutoLayout()

    let playButton = RoundButton(
        sideSize: Constant.Button.sideSize,
        image: Image.WordListScreen.Cell.play,
        backgroundColor: AppColor.black
    ).prepareForAutoLayout()

    let addButton = RoundButton(
        sideSize: Constant.Button.sideSize,
        image: Image.WordListScreen.Cell.plus,
        backgroundColor: AppColor.black
    ).prepareForAutoLayout()

    // MARK: - Internal methods

    func configCell(using model: Model) {
        vocabulaLabel.text = model.vocabula
        translationLabel.text = model.translation
        transcriptionLabel.text = model.transcription
        roundedBackgroundView.backgroundColor = model.backgroundColor
    }

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupActions()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        roundedBackgroundView.backgroundColor = nil
        vocabulaLabel.text = nil
        translationLabel.text = nil
        transcriptionLabel.text = nil
    }
}

// MARK: - Private methods

private extension WordListTableViewCell {
    // swiftlint:disable nesting
    enum Layout {
        enum RoundedBackgroundView {
            static let height: CGFloat = 120
            static let verticalSpacing: CGFloat = 4
            static let horizontalSpacing: CGFloat = 8
        }
        enum VocabulaLabel {
            static let topAnchor: CGFloat = 40
            static let leadingAnchor: CGFloat = 16
            static let trailingAnchor: CGFloat = 8
        }
        static let horizontalSpacing: CGFloat = 12
    }
    // swiftlint:enable nesting

    func setupCell() {
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        contentView.addSubview(roundedBackgroundView)
        roundedBackgroundView.addSubview(vocabulaLabel)
        roundedBackgroundView.addSubview(translationLabel)
        roundedBackgroundView.addSubview(transcriptionLabel)
        roundedBackgroundView.addSubview(playButton)
        roundedBackgroundView.addSubview(addButton)
    }

    func makeConstraints() {
        roundedBackgroundView.setHeightAnchor(Layout.RoundedBackgroundView.height)
        roundedBackgroundView.pinToSuperview(
            sides: [
                .top(Layout.RoundedBackgroundView.verticalSpacing),
                .bottom(-Layout.RoundedBackgroundView.verticalSpacing),
                .leading(Layout.RoundedBackgroundView.horizontalSpacing),
                .trailing(-Layout.RoundedBackgroundView.horizontalSpacing)
            ]
        )

        vocabulaLabel.pinToSuperview(
            sides: [
                .top(Layout.VocabulaLabel.topAnchor),
                .leading(Layout.VocabulaLabel.leadingAnchor)
            ]
        )
        vocabulaLabel.trailingAnchor.constraint(
            equalTo: transcriptionLabel.leadingAnchor,
            constant: -Layout.VocabulaLabel.trailingAnchor
        ).isActive = true
        vocabulaLabel.setContentHuggingPriority(.required, for: .horizontal)

        translationLabel.pinToSuperview(sides: [.leading(Layout.VocabulaLabel.leadingAnchor)])
        translationLabel.topAnchor.constraint(equalTo: vocabulaLabel.bottomAnchor).isActive = true
        translationLabel.trailingAnchor.constraint(
            equalTo: playButton.leadingAnchor,
            constant: -Layout.horizontalSpacing
        ).isActive = true

        transcriptionLabel.trailingAnchor.constraint(
            equalTo: playButton.leadingAnchor,
            constant: -Layout.horizontalSpacing
        ).isActive = true
        transcriptionLabel.lastBaselineAnchor.constraint(equalTo: vocabulaLabel.lastBaselineAnchor).isActive = true

        playButton.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor).isActive = true
        playButton.trailingAnchor.constraint(
            equalTo: addButton.leadingAnchor,
            constant: -Layout.horizontalSpacing
        ).isActive = true

        addButton.pinToSuperview(sides: [.trailing(-Layout.horizontalSpacing)])
        addButton.centerYAnchor.constraint(equalTo: roundedBackgroundView.centerYAnchor).isActive = true
    }

    func setupActions() {
        let playAction = UIAction { [weak self] _ in self?.play?() }
        playButton.addAction(playAction, for: .touchUpInside)

        let addAction = UIAction { [weak self] _ in self?.add?() }
        addButton.addAction(addAction, for: .touchUpInside)
    }
}
