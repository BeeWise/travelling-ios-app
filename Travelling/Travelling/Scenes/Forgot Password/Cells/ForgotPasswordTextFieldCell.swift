//
//  ForgotPasswordTextFieldCell.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 05/10/2020.
//

import UIKit

protocol ForgotPasswordTextFieldCellDelegate: AnyObject {
    func forgotPasswordTextFieldCell(cell: ForgotPasswordTextFieldCell?, textFieldDidEndEditing textField: UITextField?, itemType: ForgotPasswordModels.ItemType)
    func forgotPasswordTextFieldCell(cell: ForgotPasswordTextFieldCell?, textFieldEditingChanged textField: UITextField?, text: String, itemType: ForgotPasswordModels.ItemType)
    func forgotPasswordTextFieldCell(cell: ForgotPasswordTextFieldCell?, textFieldShouldReturn textField: UITextField?, itemType: ForgotPasswordModels.ItemType) -> Bool
}

class ForgotPasswordTextFieldCell: UITableViewCell {
    weak var titleTextFieldView: TitleTextFieldView!
    
    weak var delegate: ForgotPasswordTextFieldCellDelegate?
    
    var itemType: ForgotPasswordModels.ItemType!
    
    init() {
        super.init(style: .default, reuseIdentifier: ForgotPasswordTextFieldCell.defaultReuseIdentifier)
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
    
    func setItemType(itemType: ForgotPasswordModels.ItemType) {
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

extension ForgotPasswordTextFieldCell: TitleTextFieldViewDelegate {
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, didEndEditing textField: UITextField) {
        self.delegate?.forgotPasswordTextFieldCell(cell: self, textFieldDidEndEditing: textField, itemType: self.itemType)
    }
    
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, shouldReturn textField: UITextField) -> Bool {
        return self.delegate?.forgotPasswordTextFieldCell(cell: self, textFieldShouldReturn: textField, itemType: self.itemType) ?? true
    }
    
    func titleTextFieldView(_ titleTextFieldView: TitleTextFieldView?, editingChanged textField: UITextField, text: String?) {
        let text = textField.text ?? ""
        self.delegate?.forgotPasswordTextFieldCell(cell: self, textFieldEditingChanged: textField, text: text, itemType: self.itemType)
    }
}

// MARK: - Subviews configuration

extension ForgotPasswordTextFieldCell {
    private func setupSubviews() {
        self.setupContentView()
        self.setupTitleTextFieldView()
    }
    
    private func setupContentView() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = ForgotPasswordStyle.shared.textFieldCellModel.backgroundColor
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
        
        elements.titleAttributes = ForgotPasswordStyle.shared.textFieldCellModel.titleAttributes()
        elements.textAttributes = ForgotPasswordStyle.shared.textFieldCellModel.textAttributes()
        elements.placeholderAttributes = ForgotPasswordStyle.shared.textFieldCellModel.placeholderAttributes()
        elements.errorAttributes = ForgotPasswordStyle.shared.textFieldCellModel.errorTextAttributes()
        
        elements.borderColor = ForgotPasswordStyle.shared.textFieldCellModel.borderColor
        elements.errorBorderColor = ForgotPasswordStyle.shared.textFieldCellModel.errorBorderColor
        elements.borderWidth = ForgotPasswordStyle.shared.textFieldCellModel.borderWidth
        elements.cornerRadius = ForgotPasswordStyle.shared.textFieldCellModel.cornerRadius
        
        return elements
    }
}

// MARK: - Constraints configuration

extension ForgotPasswordTextFieldCell {
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
