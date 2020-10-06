//
//  SignUpViewController+TableViewDataSource.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

import Foundation
import UIKit

extension SignUpViewController {
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedItems.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedItem = self.displayedItems[indexPath.row]
        switch displayedItem.type {
            case .photo: return self.signUpPhotoCell(tableView, indexPath: indexPath, item: displayedItem)
            case .email: return self.signUpTextFieldCell(tableView, indexPath: indexPath, item: displayedItem)
            case .username: return self.signUpTextFieldCell(tableView, indexPath: indexPath, item: displayedItem)
            case .password: return self.signUpTextFieldCell(tableView, indexPath: indexPath, item: displayedItem)
            case .firstName: return self.signUpTextFieldCell(tableView, indexPath: indexPath, item: displayedItem)
            case .lastName: return self.signUpTextFieldCell(tableView, indexPath: indexPath, item: displayedItem)
            case .description: return self.signUpTextViewCell(tableView, indexPath: indexPath, item: displayedItem)
            case .signUp: return self.signUpButtonCell(tableView, indexPath: indexPath, item: displayedItem)
        }
    }
}

// MARK: - Photo cell

extension SignUpViewController: SignUpPhotoCellDelegate {
    private func signUpPhotoCell(_ tableView: UITableView, indexPath: IndexPath, item: SignUpModels.Item) -> SignUpPhotoCell {
        guard let model = item.model as? SignUpModels.DisplayedImageItem else {
            return SignUpPhotoCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SignUpPhotoCell.defaultReuseIdentifier, for: indexPath) as? SignUpPhotoCell ?? SignUpPhotoCell()
        cell.setItemType(itemType: item.type)
        cell.setImage(image: model.image, contentMode: model.contentMode)
        cell.delegate = self
        return cell
    }
    
    func signUpPhotoCell(cell: SignUpPhotoCell?, didSelect button: UIButton, itemType: SignUpModels.ItemType) {
        self.interactor?.shouldSelectItem(request: SignUpModels.ItemSelection.Request(itemType: itemType, sourceView: button))
    }
}

// MARK: - Text field cell

extension SignUpViewController: SignUpTextFieldCellDelegate {
    private func signUpTextFieldCell(_ tableView: UITableView, indexPath: IndexPath, item: SignUpModels.Item) -> SignUpTextFieldCell {
        guard let model = item.model as? SignUpModels.DisplayedTextItem else {
            return SignUpTextFieldCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SignUpTextFieldCell.defaultReuseIdentifier, for: indexPath) as? SignUpTextFieldCell ?? SignUpTextFieldCell()
        cell.setItemType(item.type)
        cell.setTitle(model.title)
        cell.setText(model.text)
        cell.setMaximumLength(model.maximumLength)
        cell.setPlaceholder(model.placeholder)
        cell.setError(model.errorText)
        cell.setDisplayError(model.displayError)
        cell.setKeyboardType(model.keyboardType)
        cell.setAutocapitalizationType(model.autocapitalizationType)
        cell.setAutocorrectionType(model.autocorrectionType)
        cell.setReturnKeyType(model.returnKeyType)
        cell.setIsSecureText(model.isSecureText)
        cell.delegate = self
        
        self.textFields.removeAll(where: { $0.1 == item.type })
        self.textFields.append((cell.titleTextFieldView.textField, item.type))
        
        return cell
    }
    
    func signUpTextFieldCell(cell: SignUpTextFieldCell?, textFieldDidEndEditing textField: UITextField?, itemType: SignUpModels.ItemType) {
        self.interactor?.shouldValidateItem(request: SignUpModels.ValidateItem.Request(type: itemType))
    }
    
    func signUpTextFieldCell(cell: SignUpTextFieldCell?, textFieldEditingChanged textField: UITextField?, text: String, itemType: SignUpModels.ItemType) {
        self.interactor?.shouldUpdateItem(request: SignUpModels.UpdateItem.Request(text: text, type: itemType))
    }
    
    func signUpTextFieldCell(cell: SignUpTextFieldCell?, textFieldShouldReturn textField: UITextField?, itemType: SignUpModels.ItemType) -> Bool {
        textField?.resignFirstResponder()
        self.interactor?.shouldActivateTextField(request: SignUpModels.ActivateTextField.Request(type: itemType.next()))
        return true
    }
}

// MARK: - Text view cell

extension SignUpViewController: SignUpTextViewCellDelegate {
    private func signUpTextViewCell(_ tableView: UITableView, indexPath: IndexPath, item: SignUpModels.Item) -> SignUpTextViewCell {
        guard let model = item.model as? SignUpModels.DisplayedTextItem else {
            return SignUpTextViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SignUpTextViewCell.defaultReuseIdentifier, for: indexPath) as? SignUpTextViewCell ?? SignUpTextViewCell()
        cell.setItemType(itemType: item.type)
        cell.setTitle(title: model.title)
        cell.setText(text: model.text)
        cell.setMaximumLength(value: model.maximumLength)
        cell.setError(error: model.errorText)
        cell.setDisplayError(displayError: model.displayError)
        cell.setPlaceholder(placeholder: model.placeholder)
        cell.setKeyboardType(keyboardType: model.keyboardType)
        cell.setAutocapitalizationType(model.autocapitalizationType)
        cell.setReturnKeyType(model.returnKeyType)
        cell.setAutocorrectionType(model.autocorrectionType)
        cell.delegate = self
        return cell
    }
    
    func signUpTextViewCell(cell: SignUpTextViewCell?, textViewDidEndEditing textView: UITextView?, itemType: SignUpModels.ItemType) {
        self.interactor?.shouldValidateItem(request: SignUpModels.ValidateItem.Request(type: itemType))
    }
    
    func signUpTextViewCell(cell: SignUpTextViewCell?, textViewEditingChanged textView: UITextView?, text: String, itemType: SignUpModels.ItemType) {
        self.interactor?.shouldUpdateItem(request: SignUpModels.UpdateItem.Request(text: text, type: itemType))
    }
}

// MARK: - Button cell

extension SignUpViewController: SignUpButtonCellDelegate {
    private func signUpButtonCell(_ tableView: UITableView, indexPath: IndexPath, item: SignUpModels.Item) -> SignUpButtonCell {
        guard let model = item.model as? SignUpModels.DisplayedButtonItem else {
            return SignUpButtonCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: SignUpButtonCell.defaultReuseIdentifier, for: indexPath) as? SignUpButtonCell ?? SignUpButtonCell()
        cell.setItemType(itemType: item.type)
        cell.setTitle(title: model.title)
        cell.setIsEnabled(isEnabled: model.isEnabled)
        cell.setIsLoading(isLoading: model.isLoading)
        cell.delegate = self
        return cell
    }
    
    func signUpButtonCell(cell: SignUpButtonCell?, didSelect button: UIButton, itemType: SignUpModels.ItemType) {
        self.interactor?.shouldSelectItem(request: SignUpModels.ItemSelection.Request(itemType: itemType, sourceView: button))
    }
}
