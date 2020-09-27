//
//  AppBusinessLogicSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

@testable import Travelling
import Foundation

class AppBusinessLogicSpy: AppBusinessLogic {
    var shouldSetupEnvironmentCalled: Bool = false
    var shouldSetupWindowCalled: Bool = false
    
    func shouldSetupEnvironment() {
        self.shouldSetupEnvironmentCalled = true
    }
    
    func shouldSetupWindow() {
        self.shouldSetupWindowCalled = true
    }
}
