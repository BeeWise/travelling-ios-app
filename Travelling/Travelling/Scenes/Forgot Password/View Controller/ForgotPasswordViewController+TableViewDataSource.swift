//
//  ForgotPasswordViewController+TableViewDataSource.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 05/10/2020.
//

import Foundation
import UIKit

extension ForgotPasswordViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedItem = self.displayedItems[indexPath.row]
        switch displayedItem.type {
            case .email: return self.forgotPasswordTextFieldCell(tableView, indexPath: indexPath, item: displayedItem)
            case .resetLink: return self.forgotPasswordButtonCell(tableView, indexPath: indexPath, item: displayedItem)
        }
    }
}

// MARK: - Text field cell

extension ForgotPasswordViewController: ForgotPasswordTextFieldCellDelegate {
    private func forgotPasswordTextFieldCell(_ tableView: UITableView, indexPath: IndexPath, item: ForgotPasswordModels.Item) -> ForgotPasswordTextFieldCell {
        guard let model = item.model as? ForgotPasswordModels.DisplayedTextItem else {
            return ForgotPasswordTextFieldCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: ForgotPasswordTextFieldCell.defaultReuseIdentifier, for: indexPath) as? ForgotPasswordTextFieldCell ?? ForgotPasswordTextFieldCell()
        cell.setItemType(itemType: item.type)
        cell.setTitle(title: model.title)
        cell.setText(text: model.text)
        cell.setPlaceholder(placeholder: model.placeholder)
        cell.setError(error: model.errorText)
        cell.setDisplayError(displayError: model.displayError)
        cell.setKeyboardType(keyboardType: model.keyboardType)
        cell.setAutocapitalizationType(model.autocapitalizationType)
        cell.setAutocorrectionType(model.autocorrectionType)
        cell.setIsSecureText(isSecureText: model.isSecureText)
        cell.setReturnKeyType(returnKeyType: model.returnKeyType)
        cell.delegate = self
        return cell
    }
    
    func forgotPasswordTextFieldCell(cell: ForgotPasswordTextFieldCell?, textFieldDidEndEditing textField: UITextField?, itemType: ForgotPasswordModels.ItemType) {
        self.interactor?.shouldValidateItem(request: ForgotPasswordModels.ValidateItem.Request(type: itemType))
    }
    
    func forgotPasswordTextFieldCell(cell: ForgotPasswordTextFieldCell?, textFieldEditingChanged textField: UITextField?, text: String, itemType: ForgotPasswordModels.ItemType) {
        self.interactor?.shouldUpdateItem(request: ForgotPasswordModels.UpdateItem.Request(text: text, type: itemType))
    }
    
    func forgotPasswordTextFieldCell(cell: ForgotPasswordTextFieldCell?, textFieldShouldReturn textField: UITextField?, itemType: ForgotPasswordModels.ItemType) -> Bool {
        textField?.resignFirstResponder()
        return true
    }
}

// MARK: - Button cell

extension ForgotPasswordViewController: ForgotPasswordButtonCellDelegate {
    private func forgotPasswordButtonCell(_ tableView: UITableView, indexPath: IndexPath, item: ForgotPasswordModels.Item) -> ForgotPasswordButtonCell {
        guard let model = item.model as? ForgotPasswordModels.DisplayedButtonItem else {
            return ForgotPasswordButtonCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: ForgotPasswordButtonCell.defaultReuseIdentifier, for: indexPath) as? ForgotPasswordButtonCell ?? ForgotPasswordButtonCell()
        cell.setItemType(itemType: item.type)
        cell.setTitle(title: model.title)
        cell.setIsEnabled(isEnabled: model.isEnabled)
        cell.setIsLoading(isLoading: model.isLoading)
        cell.delegate = self
        return cell
    }
    
    func forgotPasswordButtonCell(cell: ForgotPasswordButtonCell?, didSelect button: UIButton?, itemType: ForgotPasswordModels.ItemType) {
        self.interactor?.shouldSelectItem(request: ForgotPasswordModels.ItemSelection.Request(type: itemType))
    }
}
