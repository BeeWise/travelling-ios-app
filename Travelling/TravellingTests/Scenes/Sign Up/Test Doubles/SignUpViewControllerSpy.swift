//
//  SignUpViewControllerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//

@testable import Travelling
import UIKit

class SignUpViewControllerSpy: SignUpViewController {
    var presentCalled: Bool = false
    var dismissCalled: Bool = false
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentCalled = true
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismissCalled = true
    }
    
    override func photoLibraryController(sourceView: UIView) -> UIViewController {
        return UIViewController()
    }
    
    override func cameraController(sourceView: UIView) -> UIViewController {
        return UIViewController()
    }
}
