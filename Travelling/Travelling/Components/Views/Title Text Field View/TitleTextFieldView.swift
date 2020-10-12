//
//  TitleTextFieldView.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation
import UIKit

public protocol TitleTextFieldViewDelegate: AnyObject {
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, didEndEditing textField: UITextField)
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, shouldReturn textField: UITextField) -> Bool
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, editingChanged textField: UITextField, text: String?)
}

public class TitleTextFieldView: UIView, UITextFieldDelegate {
    public enum State {
        case normal
        case error
    }
    
    public struct Elements {
        public var titleAttributes: [NSAttributedString.Key: Any] = [:]
        public var textAttributes: [NSAttributedString.Key: Any] = [:]
        public var placeholderAttributes: [NSAttributedString.Key: Any] = [:]
        public var errorAttributes: [NSAttributedString.Key: Any] = [:]
        
        public var borderWidth: CGFloat = 1.0
        public var borderColor: CGColor = UIColor.lightGray.cgColor
        public var errorBorderColor: CGColor = UIColor.red.cgColor
        public var cornerRadius: CGFloat = 5.0
        
        public init() {
            
        }
    }
    
    public weak var stackView: UIStackView!
    
    public weak var containerView: UIView!
    public weak var titleLabel: UILabel!
    public weak var textField: UITextField!
    
    public weak var errorLabel: UILabel!
    
    public weak var delegate: TitleTextFieldViewDelegate?
    
    public var elements: Elements
    public var maximumLength: Int = 1024
    
    public init(elements: Elements) {
        self.elements = elements
        super.init(frame: .zero)
        self.setupSubviews()
        self.setupSubviewsConstraints()
        self.setupGestureRecognizers()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    public func setState(_ state: State) {
        switch state {
            case .normal: self.setNormalState(); break
            case .error: self.setErrorState(); break
        }
    }
    
    private func setNormalState() {
        self.containerView?.layer.borderColor = self.elements.borderColor
        self.errorLabel?.isHidden = true
    }
    
    private func setErrorState() {
        self.containerView?.layer.borderColor = self.elements.errorBorderColor
        self.errorLabel?.isHidden = false
    }
    
    public func setTitle(_ title: String) {
        self.titleLabel?.attributedText = NSAttributedString(string: title, attributes: self.elements.titleAttributes)
    }
    
    public func setText(_ text: String) {
        self.textField?.attributedText = NSAttributedString(string: text, attributes: self.elements.textAttributes)
    }
    
    public func setMaximumLength(_ value: Int) {
        self.maximumLength = value
    }
    
    public func setPlaceholder(_ placeholder: String) {
        self.textField?.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: self.elements.placeholderAttributes)
    }
    
    public func setKeyboardType(_ keyboardType: UIKeyboardType) {
        self.textField?.keyboardType = keyboardType
    }
    
    public func setAutocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) {
        self.textField?.autocapitalizationType = autocapitalizationType
    }
    
    public func setAutocorrectionType(_ autocorrectionType: UITextAutocorrectionType) {
        self.textField?.autocorrectionType = autocorrectionType
    }
    
    public func setIsSecureText(_ isSecureText: Bool) {
        self.textField?.isSecureTextEntry = isSecureText
    }
    
    public func setReturnKeyType(_ returnKeyType: UIReturnKeyType) {
        self.textField?.returnKeyType = returnKeyType
    }
    
    public func setError(_ error: String) {
        self.errorLabel?.attributedText = NSAttributedString(string: error, attributes: self.elements.errorAttributes)
    }
}

// MARK: - Text field delegate

extension TitleTextFieldView {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        self.delegate?.titleTextFieldView(self, didEndEditing: textField)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.delegate?.titleTextFieldView(self, shouldReturn: textField) ?? true
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = self.textField.text {
            if self.maximumLength < text.utf8.count + string.utf8.count {
                return false
            }
        }
        return true
    }
    
    @objc func textFieldEditingChanged(_ textField: UITextField) {
        self.delegate?.titleTextFieldView(self, editingChanged: textField, text: textField.text)
    }
}

// MARK: - Gesture recognizers

extension TitleTextFieldView {
    private func setupGestureRecognizers() {
        self.setupContainerViewGestureRecognizer()
    }
    
    private func setupContainerViewGestureRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TitleTextFieldView.touchUpInsideContainerView))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        self.containerView?.addGestureRecognizer(gestureRecognizer)
    }
}

// MARK: - Actions

extension TitleTextFieldView {
    @objc func touchUpInsideContainerView() {
        self.textField?.becomeFirstResponder()
    }
}

// MARK: - Subviews configuration

extension TitleTextFieldView {
    private func setupSubviews() {
        self.setupStackView()
        self.setupContainerView()
        self.setupErrorLabel()
        self.setupTitleLabel()
        self.setupTextField()
    }
    
    private func setupStackView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 3
        stackView.axis = .vertical
        self.addSubview(stackView)
        self.stackView = stackView
    }
    
    private func setupContainerView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = self.elements.borderWidth
        view.layer.cornerRadius = self.elements.cornerRadius
        view.isUserInteractionEnabled = true
        self.stackView?.addArrangedSubview(view)
        self.containerView = view
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        self.containerView?.addSubview(label)
        self.titleLabel = label
    }
    
    private func setupTextField() {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.clearButtonMode = .whileEditing
        textField.defaultTextAttributes = self.elements.textAttributes
        textField.typingAttributes = self.elements.textAttributes
        textField.addTarget(self, action: #selector(TitleTextFieldView.textFieldEditingChanged(_:)), for: .editingChanged)
        self.containerView?.addSubview(textField)
        self.textField = textField
    }
    
    private func setupErrorLabel() {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        self.stackView?.addArrangedSubview(label)
        self.errorLabel = label
    }
}

// MARK: - Constraints configuration

extension TitleTextFieldView {
    private func setupSubviewsConstraints() {
        self.setupStackViewConstraints()
        self.setupTitleLabelConstraints()
        self.setupTextFieldConstraints()
    }
    
    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -15)
        ])
    }
    
    private func setupTextFieldConstraints() {
        NSLayoutConstraint.activate([
            self.textField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 2),
            self.textField.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            self.textField.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -15),
            self.textField.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10)
        ])
    }
}
