//
//  AppDelegate.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var interactor: AppBusinessLogic?
    
    override init() {
        super.init()
        self.setup()
    }
    
    private func setup() {
        let interactor = AppInteractor()
        let presenter = AppPresenter()
        presenter.displayer = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.interactor?.shouldSetupWindow()
        return true
    }
}
