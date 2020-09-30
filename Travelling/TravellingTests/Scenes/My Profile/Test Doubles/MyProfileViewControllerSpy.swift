//
//  MyProfileViewControllerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

@testable import Travelling
import Foundation
import UIKit

class MyProfileViewControllerSpy: MyProfileViewController {
    var presentCalled: Bool = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentCalled = true
    }
}
