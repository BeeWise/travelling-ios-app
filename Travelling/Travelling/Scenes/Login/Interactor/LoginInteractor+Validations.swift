//
//  LoginInteractor+Validations.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation
import UIKit

extension LoginInteractor {
    func shouldValidateItem(request: LoginModels.ValidateItem.Request) {
        switch request.type {
            case .account: self.validateAccount(); break
            case .password: self.validatePassword(); break
            default: break
        }
    }
    
    // MARK: - Account validation
    
    private func validateAccount() {
        let displayError = !self.isValidAccount(account: self.loginDetails.account)
        self.presenter?.presentValidationError(response: LoginModels.ValidateItem.Response(type: LoginModels.ItemType.account, displayError: displayError))
    }
    
    private func isValidAccount(account: String) -> Bool {
        return account.count >= 6
    }
    
    // MARK: - Password validation
    
    private func validatePassword() {
        let displayError = !self.isValidPassword(password: self.loginDetails.password)
        self.presenter?.presentValidationError(response: LoginModels.ValidateItem.Response(type: LoginModels.ItemType.password, displayError: displayError))
    }
    
    private func isValidPassword(password: String) -> Bool {
        return password.count >= 6
    }
    
    // MARK: - All items validation
    
    func validateAllItems() {
        if self.isEligibleForLogin() {
            self.presenter?.presentEnableItem(response: LoginModels.EnableItem.Response(type: LoginModels.ItemType.login))
        } else {
            self.presenter?.presentDisableItem(response: LoginModels.EnableItem.Response(type: LoginModels.ItemType.login))
        }
    }
    
    private func isEligibleForLogin() -> Bool {
        return self.isValidAccount(account: self.loginDetails.account) &&
            self.isValidPassword(password: self.loginDetails.password)
    }
}
