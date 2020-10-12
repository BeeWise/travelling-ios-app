//
//  ForgotPasswordInteractor+Validations.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 05/10/2020.
//

import Foundation

extension ForgotPasswordInteractor {
    func shouldValidateItem(request: ForgotPasswordModels.ValidateItem.Request) {
        switch request.type {
            case .email: self.validateEmail(); break
            default: break
        }
    }
    
    // MARK: - Email validation
    
    private func validateEmail() {
        let displayError = !self.email.isValidEmail()
        self.presenter?.presentValidationError(response: ForgotPasswordModels.ValidateItem.Response(type: ForgotPasswordModels.ItemType.email, displayError: displayError))
    }
    
    // MARK: - All items validation
    
    func validateAllItems() {
        if self.isEligibleForSendingResetLink() {
            self.presenter?.presentEnableItem(response: ForgotPasswordModels.EnableItem.Response(type: ForgotPasswordModels.ItemType.resetLink))
        } else {
            self.presenter?.presentDisableItem(response: ForgotPasswordModels.EnableItem.Response(type: ForgotPasswordModels.ItemType.resetLink))
        }
    }
    
    private func isEligibleForSendingResetLink() -> Bool {
        return self.email.isValidEmail()
    }
}
