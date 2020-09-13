//
//  AppPresentationLogicSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

@testable import Travelling
import Foundation

class AppPresentationLogicSpy: AppPresentationLogic {
    var presentSetupWindowCalled: Bool = false
    
    func presentSetupWindow() {
        self.presentSetupWindowCalled = true
    }
}
