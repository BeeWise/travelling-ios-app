//
//  UserDefaultsManagerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

@testable import Travelling
import Foundation

class UserDefaultsManagerSpy: UserDefaultsManager {
    var userIdCalled: Bool = false
    var userIdValue: String?
    
    var setUserIdCalled: Bool = false
    
    var hasUserIdKeyCalled: Bool = false
    var hasUserIdKeyValue: Bool = false
    
    var hasUserLoggedInKeyValue: Bool = false
    var isUserLoggedInValue: Bool = false
    var setUserLoggedInValue: Bool = false
    
    var hasUserLoggedInKeyCalled: Bool = false
    var isUserLoggedInCalled: Bool = false
    var setUserLoggedInCalled: Bool = false
    
    override func userId() -> String? {
        self.userIdCalled = true
        return self.userIdValue
    }
    
    override func setUserId(id: String?) {
        self.setUserIdCalled = true
    }
    
    override func hasUserIdKey() -> Bool {
        self.hasUserIdKeyCalled = true
        return self.hasUserIdKeyValue
    }
    
    override func hasUserLoggedInKey() -> Bool {
        self.hasUserLoggedInKeyCalled = true
        return self.hasUserLoggedInKeyValue
    }
    
    override func isUserLoggedIn() -> Bool {
        self.isUserLoggedInCalled = true
        return self.isUserLoggedInValue
    }
    
    override func setUserLoggedIn(value: Bool) {
        self.setUserLoggedInCalled = true
        self.setUserLoggedInValue = value
    }
}
