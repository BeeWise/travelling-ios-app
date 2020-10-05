//
//  ForgotPasswordViewController.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 05/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class ForgotPasswordViewController: UITableViewController {
    var interactor: ForgotPasswordBusinessLogic?
    var router: ForgotPasswordRoutingLogic?
    
    var displayedItems: [ForgotPasswordModels.Item] = []
    
    // MARK: - Object lifecycle
    
    init() {
        super.init(style: .grouped)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = ForgotPasswordInteractor()
        let presenter = ForgotPasswordPresenter()
        let router = ForgotPasswordRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.displayer = viewController
        router.viewController = viewController
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubviews()
        self.interactor?.shouldSetupItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showNavigationBar()
    }
}
