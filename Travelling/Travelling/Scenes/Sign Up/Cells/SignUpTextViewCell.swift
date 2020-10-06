//
//  SignUpTextViewCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

import Foundation
import UIKit

protocol SignUpTextViewCellDelegate: NSObjectProtocol {
    func signUpTextViewCell(cell: SignUpTextViewCell?, textViewDidEndEditing textView: UITextView?, itemType: SignUpModels.ItemType)
    func signUpTextViewCell(cell: SignUpTextViewCell?, textViewEditingChanged textView: UITextView?, text: String, itemType: SignUpModels.ItemType)
}

class SignUpTextViewCell: UITableViewCell {
    weak var titleTextView: TitleTextView!
    
    weak var delegate: SignUpTextViewCellDelegate?
    
    var itemType: SignUpModels.ItemType!
    
    init() {
        super.init(style: .default, reuseIdentifier: SignUpTextViewCell.defaultReuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItemType(itemType: SignUpModels.ItemType) {
        self.itemType = itemType
    }
    
    func setTitle(title: String) {
        self.titleTextView?.setTitle(title)
    }
    
    func setText(text: String) {
        self.titleTextView?.setText(text)
    }
    
    func setMaximumLength(value: Int) {
        self.titleTextView?.setMaximumLength(value)
    }
    
    func setPlaceholder(placeholder: String) {
        self.titleTextView?.setPlaceholder(placeholder)
    }
    
    func setKeyboardType(keyboardType: UIKeyboardType) {
        self.titleTextView?.setKeyboardType(keyboardType)
    }
    
    func setAutocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) {
        self.titleTextView?.setAutocapitalizationType(autocapitalizationType)
    }
    
    func setAutocorrectionType(_ autocorrectionType: UITextAutocorrectionType) {
        self.titleTextView?.setAutocorrectionType(autocorrectionType)
    }
    
    func setReturnKeyType(_ returnKeyType: UIReturnKeyType) {
        self.titleTextView?.setReturnKeyType(returnKeyType)
    }
    
    func setError(error: String) {
        self.titleTextView?.setError(error)
    }
    
    func setDisplayError(displayError: Bool) {
        self.titleTextView?.setState(displayError ? .error : .normal)
    }
}

// MARK: - Text view delegate

extension SignUpTextViewCell: TitleTextViewDelegate {
    func titleTextView(_ titleTextView: TitleTextView?, didEndEditing textView: UITextView) {
        self.delegate?.signUpTextViewCell(cell: self, textViewDidEndEditing: textView, itemType: self.itemType)
    }
    
    func titleTextView(_ titleTextView: TitleTextView?, editingChanged textView: UITextView, text: String?) {
        self.delegate?.signUpTextViewCell(cell: self, textViewEditingChanged: textView, text: textView.text, itemType: self.itemType)
    }
}

// MARK: - Subviews configuration

extension SignUpTextViewCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupTitleTextView()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = SignUpStyle.shared.textViewCellModel.backgroundColor
    }
    
    private func setupTitleTextView() {
        let view = TitleTextView(elements: self.titleTextViewElements())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.textView?.backgroundColor = SignUpStyle.shared.textViewCellModel.backgroundColor
        self.contentView.addSubview(view)
        self.titleTextView = view
    }
    
    private func titleTextViewElements() -> TitleTextView.Elements {
        var elements = TitleTextView.Elements()
        
        elements.titleAttributes = SignUpStyle.shared.textViewCellModel.titleAttributes()
        elements.textAttributes = SignUpStyle.shared.textViewCellModel.textAttributes()
        elements.placeholderAttributes = SignUpStyle.shared.textViewCellModel.placeholderAttributes()
        elements.errorAttributes = SignUpStyle.shared.textViewCellModel.errorTextAttributes()
        
        elements.borderColor = SignUpStyle.shared.textViewCellModel.borderColor
        elements.borderWidth = SignUpStyle.shared.textViewCellModel.borderWidth
        elements.errorBorderColor = SignUpStyle.shared.textViewCellModel.errorBorderColor
        elements.cornerRadius = SignUpStyle.shared.textViewCellModel.cornerRadius
        
        return elements
    }
}

// MARK: - Constraints configuration

extension SignUpTextViewCell {
    private func setupSubviewsConstraints() {
        self.setupTitleTextViewConstraints()
    }
    
    private func setupTitleTextViewConstraints() {
        NSLayoutConstraint.activate([
            self.titleTextView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7),
            self.titleTextView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -7),
            self.titleTextView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.titleTextView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15)
        ])
    }
}
