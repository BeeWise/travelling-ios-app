//
//  Title Text View.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

import Foundation
import UIKit

public protocol TitleTextViewDelegate: AnyObject {
    func titleTextView(_ titleTextView: TitleTextView?, didEndEditing textView: UITextView)
    func titleTextView(_ titleTextView: TitleTextView?, editingChanged textView: UITextView, text: String?)
}

public class TitleTextView: UIView {
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
        public var cornerRadius: CGFloat = 4.0
        
        public init() {
            
        }
    }
    
    public weak var stackView: UIStackView!
    
    public weak var containerView: UIView!
    public weak var titleLabel: UILabel!
    public weak var textView: PlaceholderTextView!
    
    public weak var errorLabel: UILabel!
    
    public weak var delegate: TitleTextViewDelegate?
    
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
        self.textView?.attributedText = NSAttributedString(string: text, attributes: self.elements.textAttributes)
    }
    
    public func setMaximumLength(_ value: Int) {
        self.maximumLength = value
    }
    
    public func setPlaceholder(_ placeholder: String) {
        self.textView?.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: self.elements.placeholderAttributes)
    }
    
    public func setKeyboardType(_ keyboardType: UIKeyboardType) {
        self.textView?.keyboardType = keyboardType
    }
    
    public func setAutocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) {
        self.textView?.autocapitalizationType = autocapitalizationType
    }
    
    public func setAutocorrectionType(_ autocorrectionType: UITextAutocorrectionType) {
        self.textView?.autocorrectionType = autocorrectionType
    }
    
    public func setReturnKeyType(_ returnKeyType: UIReturnKeyType) {
        self.textView?.returnKeyType = returnKeyType
    }
    
    public func setError(_ error: String) {
        self.errorLabel?.attributedText = NSAttributedString(string: error, attributes: self.elements.errorAttributes)
    }
}

// MARK: - Text view delegate

extension TitleTextView: UITextViewDelegate {
    public func textViewDidEndEditing(_ textView: UITextView) {
        self.delegate?.titleTextView(self, didEndEditing: textView)
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        self.delegate?.titleTextView(self, editingChanged: textView, text: textView.text)
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if self.maximumLength < textView.text.utf8.count + text.utf8.count {
            return false
        }
        return true
    }
}

// MARK: - Gesture recognizers

extension TitleTextView {
    private func setupGestureRecognizers() {
        self.setupContainerViewGestureRecognizer()
    }
    
    private func setupContainerViewGestureRecognizer() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TitleTextView.touchUpInsideContainerView))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        self.containerView?.addGestureRecognizer(gestureRecognizer)
    }
}

// MARK: - Actions

extension TitleTextView {
    @objc func touchUpInsideContainerView() {
        self.textView?.becomeFirstResponder()
    }
}

// MARK: - Subviews configuration

extension TitleTextView {
    private func setupSubviews() {
        self.setupStackView()
        self.setupContainerView()
        self.setupTitleLabel()
        self.setupTextView()
        self.setupErrorLabel()
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
        view.layer.borderColor = self.elements.borderColor
        view.layer.cornerRadius = self.elements.cornerRadius
        view.isUserInteractionEnabled = true
        self.stackView?.addArrangedSubview(view)
        self.containerView = view
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        self.containerView?.addSubview(label)
        self.titleLabel = label
    }
    
    private func setupTextView() {
        let textView = PlaceholderTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.typingAttributes = self.elements.textAttributes
        textView.delegate = self
        textView.setContentHuggingPriority(.defaultLow, for: .vertical)
        self.containerView?.addSubview(textView)
        self.textView = textView
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

extension TitleTextView {
    private func setupSubviewsConstraints() {
        self.setupStackViewConstraints()
        self.setupContainerViewConstraints()
        self.setupTitleLabelConstraints()
        self.setupTextViewConstraints()
    }
    
    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 125)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 10),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -15)
        ])
    }
    
    private func setupTextViewConstraints() {
        NSLayoutConstraint.activate([
            self.textView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 2),
            self.textView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10),
            self.textView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 15),
            self.textView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -15)
        ])
    }
}
