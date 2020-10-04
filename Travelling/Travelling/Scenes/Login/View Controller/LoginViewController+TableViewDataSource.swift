//
//  LoginViewController+TableViewDataSource.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import UIKit

extension LoginViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedItem = self.displayedItems[indexPath.row]
        switch displayedItem.type {
            case .account: return self.loginTextFieldCell(tableView, indexPath: indexPath, item: displayedItem)
            case .password: return self.loginTextFieldCell(tableView, indexPath: indexPath, item: displayedItem)
            case .forgotPassword: return self.loginForgotPasswordButtonCell(tableView, indexPath: indexPath, item: displayedItem)
            case .login: return self.loginButtonCell(tableView, indexPath: indexPath, item: displayedItem)
        }
    }
}

// MARK: - Text field cell

extension LoginViewController: LoginTextFieldCellDelegate {
    private func loginTextFieldCell(_ tableView: UITableView, indexPath: IndexPath, item: LoginModels.Item) -> LoginTextFieldCell {
        guard let model = item.model as? LoginModels.DisplayedTextItem else {
            return LoginTextFieldCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: LoginTextFieldCell.defaultReuseIdentifier, for: indexPath) as? LoginTextFieldCell ?? LoginTextFieldCell()
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
        
        self.textFields.removeAll(where: { $0.1 == item.type })
        self.textFields.append((cell.titleTextFieldView.textField, item.type))
        
        return cell
    }
    
    func loginTextFieldCell(cell: LoginTextFieldCell?, textFieldDidEndEditing textField: UITextField?, itemType: LoginModels.ItemType) {
        self.interactor?.shouldValidateItem(request: LoginModels.ValidateItem.Request(type: itemType))
    }
    
    func loginTextFieldCell(cell: LoginTextFieldCell?, textFieldEditingChanged textField: UITextField?, text: String, itemType: LoginModels.ItemType) {
        self.interactor?.shouldUpdateItem(request: LoginModels.UpdateItem.Request(text: text, type: itemType))
    }
    
    func loginTextFieldCell(cell: LoginTextFieldCell?, textFieldShouldReturn textField: UITextField?, itemType: LoginModels.ItemType) -> Bool {
        textField?.resignFirstResponder()
        self.interactor?.shouldActivateTextField(request: LoginModels.ActivateTextField.Request(type: itemType.next()))
        return true
    }
}

// MARK: - Button cell

extension LoginViewController: LoginButtonCellDelegate, LoginForgotPasswordButtonCellDelegate {
    private func loginButtonCell(_ tableView: UITableView, indexPath: IndexPath, item: LoginModels.Item) -> LoginButtonCell {
        guard let model = item.model as? LoginModels.DisplayedButtonItem else {
            return LoginButtonCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: LoginButtonCell.defaultReuseIdentifier, for: indexPath) as? LoginButtonCell ?? LoginButtonCell()
        cell.setItemType(itemType: item.type)
        cell.setTitle(title: model.title)
        cell.setIsEnabled(isEnabled: model.isEnabled)
        cell.setIsLoading(isLoading: model.isLoading)
        cell.delegate = self
        return cell
    }
    
    private func loginForgotPasswordButtonCell(_ tableView: UITableView, indexPath: IndexPath, item: LoginModels.Item) -> LoginForgotPasswordButtonCell {
        guard let model = item.model as? LoginModels.DisplayedButtonItem else {
            return LoginForgotPasswordButtonCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: LoginForgotPasswordButtonCell.defaultReuseIdentifier, for: indexPath) as? LoginForgotPasswordButtonCell ?? LoginForgotPasswordButtonCell()
        cell.setItemType(itemType: item.type)
        cell.setTitle(title: model.title)
        cell.setIsEnabled(isEnabled: model.isEnabled)
        cell.delegate = self
        return cell
    }
    
    func loginButtonCell(cell: LoginButtonCell?, didSelect button: UIButton?, itemType: LoginModels.ItemType) {
        self.interactor?.shouldSelectItem(request: LoginModels.ItemSelection.Request(type: itemType))
    }
    
    func loginForgotPasswordButtonCell(cell: LoginForgotPasswordButtonCell?, didSelect button: UIButton?, itemType: LoginModels.ItemType) {
        self.interactor?.shouldSelectItem(request: LoginModels.ItemSelection.Request(type: itemType))
    }
}
