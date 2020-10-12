//
//  OnboardingViewControllerDelegateSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

@testable import Travelling
import Foundation

class OnboardingViewControllerDelegateSpy: OnboardingViewControllerDelegate {
    var onboardingViewControllerDidLoginUserCalled: Bool = false
    var onboardingViewControllerDidSignUpUserCalled: Bool = false
    
    func onboardingViewController(_ viewController: OnboardingViewController?, didLoginUser user: User) {
        self.onboardingViewControllerDidLoginUserCalled = true
    }
    
    func onboardingViewController(_ viewController: OnboardingViewController?, didSignUpUser user: User) {
        self.onboardingViewControllerDidSignUpUserCalled = true
    }
}
