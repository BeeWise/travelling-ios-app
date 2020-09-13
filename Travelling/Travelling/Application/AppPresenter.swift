//
//  AppPresenter.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

import Foundation
import UIKit

protocol AppPresentationLogic {
    func presentSetupWindow()
}

class AppPresenter: AppPresentationLogic {
    weak var displayer: AppDisplayLogic?
    
    func presentSetupWindow() {
        let frame = UIScreen.main.bounds
        let backgroundColor = ApplicationStyle.colors.primaryLight
        self.displayer?.displaySetupWindow(viewModel: AppModels.WindowSetup.ViewModel(frame: frame, backgroundColor: backgroundColor))
    }
}
