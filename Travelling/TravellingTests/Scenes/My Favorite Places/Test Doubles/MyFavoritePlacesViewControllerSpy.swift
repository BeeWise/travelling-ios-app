//
//  MyFavoritePlacesViewControllerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/10/2020.
//

@testable import Travelling
import Foundation
import UIKit

class MyFavoritePlacesViewControllerSpy: MyFavoritePlacesViewController {
    var shouldLoginUserCalled: Bool = false
    var shouldLogoutUserCalled: Bool = false
        
    override func shouldLoginUser(user: User) {
        self.shouldLoginUserCalled = true
    }
    
    override func shouldLogoutUser() {
        self.shouldLogoutUserCalled = true
    }
}
