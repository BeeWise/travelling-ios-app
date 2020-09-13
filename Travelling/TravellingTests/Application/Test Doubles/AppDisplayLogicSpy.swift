//
//  AppDisplayLogicSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

@testable import Travelling
import Foundation
import UIKit

class AppDisplayLogicSpy: AppDisplayLogic {
    var window: UIWindow?
    
    var displaySetupWindowCalled: Bool = false
    
    func displaySetupWindow(viewModel: AppModels.WindowSetup.ViewModel) {
        self.displaySetupWindowCalled = true
    }
}
