//
//  UserDefaultsManager.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation

open class UserDefaultsManager {
    public static let shared = UserDefaultsManager()
    
    public init() {
    }
    
    open func hasUserIdKey() -> Bool {
        return UserDefaults.standard.object(forKey: Keys.userId) != nil
    }
    
    open func setUserId(id: String?) {
        UserDefaults.standard.set(id, forKey: Keys.userId)
    }
    
    open func userId() -> String? {
        return UserDefaults.standard.string(forKey: Keys.userId)
    }
    
    open func hasUserLoggedInKey() -> Bool {
        return UserDefaults.standard.object(forKey: Keys.userLoggedIn) != nil
    }
    
    open func isUserLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: Keys.userLoggedIn)
    }
    
    open func setUserLoggedIn(value: Bool) {
        UserDefaults.standard.set(value, forKey: Keys.userLoggedIn)
    }
    
    // MARK: - Keys
    
    public struct Keys {
        static let
        userId = "travelling.user.id",
        userLoggedIn = "travelling.user.logged.in"
    }
}
