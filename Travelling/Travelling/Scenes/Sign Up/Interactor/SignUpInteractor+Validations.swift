//
//  SignUpInteractor+Validations.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

import Foundation

extension SignUpInteractor {
    func shouldValidateItem(request: SignUpModels.ValidateItem.Request) {
        switch request.type {
            case .email: self.validateEmail(); break
            case .username: self.validateUsername(); break
            case .password: self.validatePassword(); break
            case .firstName: self.validateFirstName(); break
            case .lastName: self.validateLastName(); break
            default: break
        }
    }
    
    // MARK: - Email validation
    
    private func validateEmail() {
        let displayError = !self.isValidEmail(email: self.userDetails.email)
        self.presenter?.presentValidationError(response: SignUpModels.ValidateItem.Response(type: SignUpModels.ItemType.email, displayError: displayError))
    }
    
    private func isValidEmail(email: String) -> Bool {
        return email.isValidEmail()
    }
    
    // MARK: - Username validation
    
    private func validateUsername() {
        let displayError = !self.isValidUsername(username: self.userDetails.username)
        self.presenter?.presentValidationError(response: SignUpModels.ValidateItem.Response(type: SignUpModels.ItemType.username, displayError: displayError))
    }
    
    private func isValidUsername(username: String) -> Bool {
        let regexString = "^[a-zA-Z0-9_\\-.]{6,}$"
        let regexPredicate = NSPredicate(format:"SELF MATCHES %@", regexString)
        return regexPredicate.evaluate(with: username)
    }
    
    // MARK: - Password validation
    
    private func validatePassword() {
        let displayError = !self.isValidPassword(password: self.userDetails.password)
        self.presenter?.presentValidationError(response: SignUpModels.ValidateItem.Response(type: SignUpModels.ItemType.password, displayError: displayError))
    }
    
    private func isValidPassword(password: String) -> Bool {
        return password.count >= 6
    }
    
    // MARK: - First name validation
    
    private func validateFirstName() {
        let displayError = !self.isValidFirstName(firstName: self.userDetails.firstName)
        self.presenter?.presentValidationError(response: SignUpModels.ValidateItem.Response(type: SignUpModels.ItemType.firstName, displayError: displayError))
    }
    
    private func isValidFirstName(firstName: String) -> Bool {
        return firstName.count >= 1
    }
    
    // MARK: - Last name validation
    
    private func validateLastName() {
        let displayError = !self.isValidLastName(lastName: self.userDetails.lastName)
        self.presenter?.presentValidationError(response: SignUpModels.ValidateItem.Response(type: SignUpModels.ItemType.lastName, displayError: displayError))
    }
    
    private func isValidLastName(lastName: String) -> Bool {
        return lastName.count >= 1
    }
    
    // MARK: - All items validation
    
    func validateAllItems() {
        if self.isEligibleForSignUp() {
            self.presenter?.presentEnableItem(response: SignUpModels.EnableItem.Response(type: SignUpModels.ItemType.signUp))
        } else {
            self.presenter?.presentDisableItem(response: SignUpModels.EnableItem.Response(type: SignUpModels.ItemType.signUp))
        }
    }
    
    private func isEligibleForSignUp() -> Bool {
        return self.isValidEmail(email: self.userDetails.email) &&
            self.isValidUsername(username: self.userDetails.username) &&
            self.isValidPassword(password: self.userDetails.password) &&
            self.isValidFirstName(firstName: self.userDetails.firstName) &&
            self.isValidLastName(lastName: self.userDetails.lastName)
    }
}
