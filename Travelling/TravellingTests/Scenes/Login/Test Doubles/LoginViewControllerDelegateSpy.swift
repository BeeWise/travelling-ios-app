//
//  LoginViewControllerDelegateSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

@testable import Travelling
import UIKit

class LoginViewControllerDelegateSpy: NSObject, LoginViewControllerDelegate {
    var loginViewControllerDidLoginUserCalled: Bool = false
    
    func loginViewController(_ viewController: LoginViewController?, didLoginUser user: User) {
        self.loginViewControllerDidLoginUserCalled = true
    }
}
