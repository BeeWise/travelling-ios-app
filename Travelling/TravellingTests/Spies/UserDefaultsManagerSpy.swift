//
//  UserDefaultsManagerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

@testable import Travelling
import Foundation

class UserDefaultsManagerSpy: UserDefaultsManager {
    private let suiteName = "user.defaults.manager.spy.suite.name"
    
    var userValue: User?
    var userCalled: Bool = false
    
    var photoValue: Photo?
    var photoCalled: Bool = false
    
    var saveUserCalled: Bool = false
    var savePhotoCalled: Bool = false
    
    var removeUserCalled: Bool = false
    var removePhotoCalled: Bool = false
    
    override init() {
        super.init()
        self.userDefaults = UserDefaults(suiteName: self.suiteName)
    }
    
    deinit {
        self.userDefaults?.removeSuite(named: self.suiteName)
    }
    
    override func user() -> User? {
        self.userCalled = true
        return self.userValue
    }
    
    override func photo() -> Photo? {
        self.photoCalled = true
        return self.photoValue
    }
    
    override func saveUser(_ user: User) {
        self.saveUserCalled = true
    }
    
    override func savePhoto(_ photo: Photo?) {
        self.savePhotoCalled = true
    }
    
    override func removeUser() {
        self.removeUserCalled = true
    }
    
    override func removePhoto() {
        self.removePhotoCalled = true
    }
}
