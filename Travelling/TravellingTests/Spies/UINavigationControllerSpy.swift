//
//  UINavigationControllerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation
import UIKit

class UINavigationControllerSpy: UINavigationController {
    var popViewControllerCalled: Bool = false
    var presentCalled: Bool = false
    
    var pushedViewController: UIViewController?
    
    override func popViewController(animated: Bool) -> UIViewController? {
        self.popViewControllerCalled = true
        return UIViewController()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.pushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.presentCalled = true
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
