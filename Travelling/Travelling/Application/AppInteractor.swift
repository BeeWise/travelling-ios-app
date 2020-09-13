//
//  AppInteractor.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

import Foundation

protocol AppBusinessLogic {
    func shouldSetupWindow()
}

class AppInteractor: AppBusinessLogic {
    var presenter: AppPresentationLogic?
        
    func shouldSetupWindow() {
        self.presenter?.presentSetupWindow()
    }
}
