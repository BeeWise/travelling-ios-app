//
//  OnboardingViewControllerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

@testable import Travelling
import Foundation
import UIKit

class OnboardingViewControllerSpy: OnboardingViewController {
    var dismissCalled: Bool = false
    var presentCalled: Bool = false
        
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismissCalled = true
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentCalled = true
    }
}
