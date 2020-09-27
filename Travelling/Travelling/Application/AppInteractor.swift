//
//  AppInteractor.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

import Foundation

protocol AppBusinessLogic {
    func shouldSetupEnvironment()
    func shouldSetupWindow()
}

class AppInteractor: AppBusinessLogic {
    var presenter: AppPresentationLogic?
    
    func shouldSetupEnvironment() {
        let environment = BundleConfiguration.string(for: BundleConfiguration.Keys.taskConfiguratorEnvironment)
        TaskConfigurator.shared.environment = TaskEnvironment.from(value: environment)
    }
    
    func shouldSetupWindow() {
        self.presenter?.presentSetupWindow()
    }
}
