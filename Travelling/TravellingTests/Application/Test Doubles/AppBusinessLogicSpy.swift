//
//  AppBusinessLogicSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

@testable import Travelling
import Foundation

class AppBusinessLogicSpy: AppBusinessLogic {
    var shouldSetupWindowCalled: Bool = false
    
    func shouldSetupWindow() {
        self.shouldSetupWindowCalled = true
    }
}
