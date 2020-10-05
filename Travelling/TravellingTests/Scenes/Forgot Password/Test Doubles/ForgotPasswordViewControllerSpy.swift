//
//  ForgotPasswordViewControllerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 05/10/2020.
//

@testable import Travelling
import UIKit

class ForgotPasswordViewControllerSpy: ForgotPasswordViewController {
    var presentCalled: Bool = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentCalled = true
    }
}
