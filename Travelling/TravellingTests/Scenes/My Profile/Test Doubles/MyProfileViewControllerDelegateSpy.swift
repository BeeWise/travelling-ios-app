//
//  MyProfileViewControllerDelegateSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

@testable import Travelling
import Foundation

class MyProfileViewControllerDelegateSpy: MyProfileViewControllerDelegate {
    var myProfileViewControllerDidLogoutUserCalled: Bool = false
    
    func myProfileViewControllerDidLogoutUser(viewController: MyProfileViewController?) {
        self.myProfileViewControllerDidLogoutUserCalled = true
    }
}
