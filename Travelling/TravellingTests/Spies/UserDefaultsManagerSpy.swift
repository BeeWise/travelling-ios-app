//
//  UserDefaultsManagerSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

@testable import Travelling
import Foundation

class UserDefaultsManagerSpy: UserDefaultsManager {
    var userIdValue: String?
    
    override func userId() -> String? {
        return self.userIdValue
    }
}
