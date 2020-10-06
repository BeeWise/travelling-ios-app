//
//  SignUpTextFieldCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

import Foundation
import UIKit

protocol SignUpTextFieldCellDelegate: NSObjectProtocol {
    func signUpTextFieldCell(cell: SignUpTextFieldCell?, textFieldDidEndEditing textField: UITextField?, itemType: SignUpModels.ItemType)
    func signUpTextFieldCell(cell: SignUpTextFieldCell?, textFieldEditingChanged textField: UITextField?, text: String, itemType: SignUpModels.ItemType)
    func signUpTextFieldCell(cell: SignUpTextFieldCell?, textFieldShouldReturn textField: UITextField?, itemType: SignUpModels.ItemType) -> Bool
}

class SignUpTextFieldCell: UITableViewCell {
    weak var titleTextFieldView: TitleTextFieldView!
    
    weak var delegate: SignUpTextFieldCellDelegate?
    
    var itemType: SignUpModels.ItemType!
    
    init() {
        super.init(style: .default, reuseIdentifier: SignUpTextFieldCell.defaultReuseIdentifier)
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
    
    func setItemType(_ itemType: SignUpModels.ItemType) {
        self.itemType = itemType
    }
    
    func setTitle(_ title: String) {
        self.titleTextFieldView?.setTitle(title)
    }
    
    func setText(_ text: String) {
        self.titleTextFieldView?.setText(text)
    }
    
    func setMaximumLength(_ value: Int) {
        self.titleTextFieldView?.setMaximumLength(value)
    }
    
    func setPlaceholder(_ placeholder: String) {
        self.titleTextFieldView?.setPlaceholder(placeholder)
    }
    
    func setKeyboardType(_ keyboardType: UIKeyboardType) {
        self.titleTextFieldView?.setKeyboardType(keyboardType)
    }
    
    func setAutocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) {
        self.titleTextFieldView?.setAutocapitalizationType(autocapitalizationType)
    }
    
    func setAutocorrectionType(_ autocorrectionType: UITextAutocorrectionType) {
        self.titleTextFieldView?.setAutocorrectionType(autocorrectionType)
    }
    
    func setIsSecureText(_ isSecureText: Bool) {
        self.titleTextFieldView?.setIsSecureText(isSecureText)
    }
    
    func setReturnKeyType(_ returnKeyType: UIReturnKeyType) {
        self.titleTextFieldView?.setReturnKeyType(returnKeyType)
    }
    
    func setError(_ error: String) {
        self.titleTextFieldView?.setError(error)
    }
    
    func setDisplayError(_ displayError: Bool) {
        self.titleTextFieldView?.setState(displayError ? .error : .normal)
    }
}

// MARK: - Title Text field view delegate

extension SignUpTextFieldCell: TitleTextFieldViewDelegate {
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, didEndEditing textField: UITextField) {
        self.delegate?.signUpTextFieldCell(cell: self, textFieldDidEndEditing: textField, itemType: self.itemType)
    }
    
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, shouldReturn textField: UITextField) -> Bool {
        return self.delegate?.signUpTextFieldCell(cell: self, textFieldShouldReturn: textField, itemType: self.itemType) ?? true
    }
    
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, editingChanged textField: UITextField, text: String?) {
        let text = textField.text ?? ""
        self.delegate?.signUpTextFieldCell(cell: self, textFieldEditingChanged: textField, text: text, itemType: self.itemType)
    }
}

// MARK: - Subviews configuration

extension SignUpTextFieldCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupTitleTextFieldView()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = SignUpStyle.shared.textFieldCellModel.backgroundColor
    }
    
    private func setupTitleTextFieldView() {
        let view = TitleTextFieldView(elements: self.titleTextFieldViewElements())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        self.contentView.addSubview(view)
        self.titleTextFieldView = view
    }
    
    private func titleTextFieldViewElements() -> TitleTextFieldView.Elements {
        var elements = TitleTextFieldView.Elements()
        
        elements.titleAttributes = SignUpStyle.shared.textFieldCellModel.titleAttributes()
        elements.textAttributes = SignUpStyle.shared.textFieldCellModel.textAttributes()
        elements.placeholderAttributes = SignUpStyle.shared.textFieldCellModel.placeholderAttributes()
        elements.errorAttributes = SignUpStyle.shared.textFieldCellModel.errorTextAttributes()
        
        elements.borderColor = SignUpStyle.shared.textFieldCellModel.borderColor
        elements.errorBorderColor = SignUpStyle.shared.textFieldCellModel.errorBorderColor
        elements.borderWidth = SignUpStyle.shared.textFieldCellModel.borderWidth
        elements.cornerRadius = SignUpStyle.shared.textFieldCellModel.cornerRadius
        
        return elements
    }
}

// MARK: - Constraints configuration

extension SignUpTextFieldCell {
    private func setupSubviewsConstraints() {
        self.setupTitleTextFieldViewConstraints()
    }
    
    private func setupTitleTextFieldViewConstraints() {
        self.titleTextFieldView?.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7).isActive = true
        self.titleTextFieldView?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -7).isActive = true
        self.titleTextFieldView?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        self.titleTextFieldView?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
    }
}
