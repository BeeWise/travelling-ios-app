//
//  AppDelegate+DisplayLogic.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

import Foundation
import UIKit

protocol AppDisplayLogic: class {
    var window: UIWindow? { get set }
    
    func displaySetupWindow(viewModel: AppModels.WindowSetup.ViewModel)
}

extension AppDelegate: AppDisplayLogic {
    func displaySetupWindow(viewModel: AppModels.WindowSetup.ViewModel) {
        DispatchQueue.main.async {
            self.window = UIWindow(frame: viewModel.frame)
            self.window?.rootViewController = MainViewController()
            self.window?.backgroundColor = viewModel.backgroundColor
            self.window?.makeKeyAndVisible()
        }
    }
}
