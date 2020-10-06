//
//  SignUpViewControllerDelegateSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

@testable import Travelling
import UIKit

class SignUpViewControllerDelegateSpy: SignUpViewControllerDelegate {
    var signUpViewControllerDidSignUpUserCalled: Bool = false
    
    func signUpViewController(_ viewController: SignUpViewController?, didSignUpUser user: User) {
        self.signUpViewControllerDidSignUpUserCalled = true
    }
}
