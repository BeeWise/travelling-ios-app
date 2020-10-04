//
//  LoginTextFieldCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation
import UIKit

protocol LoginTextFieldCellDelegate: AnyObject {
    func loginTextFieldCell(cell: LoginTextFieldCell?, textFieldDidEndEditing textField: UITextField?, itemType: LoginModels.ItemType)
    func loginTextFieldCell(cell: LoginTextFieldCell?, textFieldEditingChanged textField: UITextField?, text: String, itemType: LoginModels.ItemType)
    func loginTextFieldCell(cell: LoginTextFieldCell?, textFieldShouldReturn textField: UITextField?, itemType: LoginModels.ItemType) -> Bool
}

class LoginTextFieldCell: UITableViewCell {
    weak var titleTextFieldView: TitleTextFieldView!
    
    weak var delegate: LoginTextFieldCellDelegate?
    
    var itemType: LoginModels.ItemType!
    
    init() {
        super.init(style: .default, reuseIdentifier: LoginTextFieldCell.defaultReuseIdentifier)
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
    
    func setItemType(itemType: LoginModels.ItemType) {
        self.itemType = itemType
    }
    
    func setTitle(title: String) {
        self.titleTextFieldView?.setTitle(title)
    }
    
    func setText(text: String) {
        self.titleTextFieldView?.setText(text)
    }
    
    func setPlaceholder(placeholder: String) {
        self.titleTextFieldView?.setPlaceholder(placeholder)
    }
    
    func setKeyboardType(keyboardType: UIKeyboardType) {
        self.titleTextFieldView?.setKeyboardType(keyboardType)
    }
    
    func setAutocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) {
        self.titleTextFieldView?.setAutocapitalizationType(autocapitalizationType)
    }
    
    func setAutocorrectionType(_ autocorrectionType: UITextAutocorrectionType) {
        self.titleTextFieldView?.setAutocorrectionType(autocorrectionType)
    }
    
    func setIsSecureText(isSecureText: Bool) {
        self.titleTextFieldView?.setIsSecureText(isSecureText)
    }
    
    func setReturnKeyType(returnKeyType: UIReturnKeyType) {
        self.titleTextFieldView?.setReturnKeyType(returnKeyType)
    }
    
    func setError(error: String) {
        self.titleTextFieldView?.setError(error)
    }
    
    func setDisplayError(displayError: Bool) {
        self.titleTextFieldView?.setState(displayError ? .error : .normal)
    }
}

// MARK: - Title Text field view delegate

extension LoginTextFieldCell: TitleTextFieldViewDelegate {
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, didEndEditing textField: UITextField) {
        self.delegate?.loginTextFieldCell(cell: self, textFieldDidEndEditing: textField, itemType: self.itemType)
    }
    
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, shouldReturn textField: UITextField) -> Bool {
        return self.delegate?.loginTextFieldCell(cell: self, textFieldShouldReturn: textField, itemType: self.itemType) ?? true
    }
    
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, editingChanged textField: UITextField, text: String?) {
        let text = textField.text ?? ""
        self.delegate?.loginTextFieldCell(cell: self, textFieldEditingChanged: textField, text: text, itemType: self.itemType)
    }
}

// MARK: - Subviews configuration

extension LoginTextFieldCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupTitleTextFieldView()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
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
        
        elements.titleAttributes = LoginStyle.shared.textFieldCellModel.titleAttributes()
        elements.textAttributes = LoginStyle.shared.textFieldCellModel.textAttributes()
        elements.placeholderAttributes = LoginStyle.shared.textFieldCellModel.placeholderAttributes()
        elements.errorAttributes = LoginStyle.shared.textFieldCellModel.errorTextAttributes()
        
        elements.borderColor = LoginStyle.shared.textFieldCellModel.borderColor
        elements.errorBorderColor = LoginStyle.shared.textFieldCellModel.errorBorderColor
        elements.borderWidth = LoginStyle.shared.textFieldCellModel.borderWidth
        elements.cornerRadius = LoginStyle.shared.textFieldCellModel.cornerRadius
        
        return elements
    }
}

// MARK: - Constraints configuration

extension LoginTextFieldCell {
    private func setupSubviewsConstraints() {
        self.setupTitleTextFieldViewConstraints()
    }
    
    private func setupTitleTextFieldViewConstraints() {
        self.titleTextFieldView?.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        self.titleTextFieldView?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -7).isActive = true
        self.titleTextFieldView?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        self.titleTextFieldView?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
    }
}
