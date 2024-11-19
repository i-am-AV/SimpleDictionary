//
//  AddingWordView.swift
//  SimpleDictionary
//
//  Created by Alex Vasilyev on 09.10.2024.
//

import UIKit

// font

enum AddingWordView1 {
    enum TextField {
        static let vocabula: UIFont = UIFont.systemFont(ofSize: 34, weight: .medium, width: .expanded)
        static let transcription: UIFont = UIFont.systemFont(ofSize: 34, weight: .regular, width: .expanded)
        static let translation: UIFont = UIFont.systemFont(ofSize: 34, weight: .regular, width: .condensed)
    }
}

// color

enum AddingWordView2 {
    enum TextField {
        static let transcription: UIColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
    }
}

final class TextField: UITextField {
    init(
        placeholder: String? = nil,
        font: UIFont? = nil,
        textColor: UIColor? = nil,
        tintColor: UIColor? = nil,
        isFirstResponder: Bool = false,
        isHidden: Bool = false
    ) {
        super.init(frame: .zero)

        if let placeholder { self.placeholder = placeholder }
        if let font { self.font = font }
        if let textColor { self.textColor = textColor }
        if let tintColor { self.tintColor = tintColor }
        if isFirstResponder { becomeFirstResponder() }
        if isHidden { self.isHidden = isHidden }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class AddingWordView: UIView {
    enum State {
        /// Исходное состояние (поле ввода пустое)
        case initial
        /// Состояние ввода
        case input
        /// Состояние загрузки данных
        case loading
        /// Состояние показа результата
        case result
    }

    // MARK: - Private UI properties
    private let vocabulaTextField = TextField(
        font: AddingWordView1.TextField.vocabula,
        tintColor: .black,
        isFirstResponder: true
    ).prepareForAutoLayout()

    #warning("Локализовать")
    private let placeholderLabel = Label(
        "Введите новое слово",
        font: .systemFont(ofSize: 34, weight: .medium, width: .expanded),
        textColor: UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6),
        numberOfLines: .zero
    ).prepareForAutoLayout()

    private let transcriptionTextField = TextField(
        font: AddingWordView1.TextField.transcription,
        textColor: AddingWordView2.TextField.transcription,
        tintColor: .black,
        isHidden: true
    ).prepareForAutoLayout()

    private let transcriptionActivity: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large).prepareForAutoLayout()
        activityIndicator.color = .black
        return activityIndicator
    }()

    private let translationTextField = TextField(
        font: AddingWordView1.TextField.translation,
        tintColor: .black,
        isHidden: true
    ).prepareForAutoLayout()

    private let translationActivity: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large).prepareForAutoLayout()
        activityIndicator.color = .black
        return activityIndicator
    }()

    func set(state newState: State) {
        switch newState {
        case .initial:
            /// Скрываем поля ввода для транскрипции и перевода
            transcriptionActivity.stopAnimating()
            translationActivity.stopAnimating()

            transcriptionTextField.isHidden = true
            translationTextField.isHidden = true
        case .input:
            /// Скрываем поля ввода для транскрипции и перевода
            transcriptionActivity.stopAnimating()
            translationActivity.stopAnimating()

            transcriptionTextField.isHidden = true
            translationTextField.isHidden = true
        case .loading:
            /// Показываем индикаторы загрузки
            /// Поля ввода для транскрипции и перевода скрыты
            transcriptionActivity.startAnimating()
            translationActivity.startAnimating()

            transcriptionTextField.isHidden = true
            translationTextField.isHidden = true
        case .result:
            /// Показаны все поля ввода с результатами
            transcriptionActivity.stopAnimating()
            translationActivity.stopAnimating()

            transcriptionTextField.isHidden = false
            translationTextField.isHidden = false
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupVocabulaTextFieldActions()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AddingWordView {
    func setupView() {
        addSubviews()
        makeConstraints()
    }

    func addSubviews() {
        addSubview(vocabulaTextField)
        vocabulaTextField.addSubview(placeholderLabel)

        addSubview(transcriptionActivity)
        addSubview(transcriptionTextField)

        addSubview(translationActivity)
        addSubview(translationTextField)
    }

    func makeConstraints() {
        vocabulaTextField.pinToSuperview(sides: [.top(90), .leading(20), .trailing(-20)])
        placeholderLabel.pinToSuperview(excluding: .bottom())

        transcriptionTextField.pinToSuperview(sides: [.leading(20), .trailing(-20)])
        transcriptionTextField.topAnchor.constraint(
            equalTo: vocabulaTextField.bottomAnchor,
            constant: 40
        ).isActive = true
        transcriptionActivity.centerXAnchor.constraint(equalTo: transcriptionTextField.centerXAnchor).isActive = true
        transcriptionActivity.centerYAnchor.constraint(equalTo: transcriptionTextField.centerYAnchor).isActive = true

        translationTextField.pinToSuperview(sides: [.leading(20), .trailing(-20)])
        translationTextField.topAnchor.constraint(
            equalTo: transcriptionTextField.bottomAnchor,
            constant: 40
        ).isActive = true
        translationActivity.centerXAnchor.constraint(equalTo: translationTextField.centerXAnchor).isActive = true
        translationActivity.centerYAnchor.constraint(equalTo: translationTextField.centerYAnchor).isActive = true
    }

    func setupVocabulaTextFieldActions() {
        let action = UIAction { [weak self] action in
            guard
                let textField = action.sender as? UITextField,
                let text: String = textField.text,
                let self
            else {
                self?.showPlaceholder()
                return
            }

            if text.isEmpty {
                showPlaceholder()
                set(state: .initial)
            } else {
                hidePlaceholder()
                set(state: .loading)
            }
        }
        vocabulaTextField.addAction(action, for: .editingChanged)
    }

    func hidePlaceholder() {
        placeholderLabel.isHidden = true
    }

    func showPlaceholder() {
        placeholderLabel.isHidden = false
    }
}

#warning("Не забыть удалить")
import SwiftUI
struct SwiftUIAddingWordView: UIViewRepresentable {
    // 1
    func makeUIView(context: Context) -> AddingWordView {
        return AddingWordView()

    }
    func updateUIView(_ view: AddingWordView, context: Context) {}
}

struct AddingWordView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAddingWordView()
    }
}
