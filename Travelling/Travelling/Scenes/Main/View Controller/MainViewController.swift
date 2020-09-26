//
//  MainViewController.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class MainViewController: UITabBarController {
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic)?
    
    var exploreViewController: ExploreViewController!
    var myFavoritesViewController: UIViewController!
    var myProfileViewController: UIViewController!
    
    // MARK: - Object lifecycle
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.displayer = viewController
        router.viewController = viewController
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.setupSubviews()
        self.setupViewControllers()
        self.interactor?.shouldSetupScenes()
        self.interactor?.shouldSelectInitialScene()
    }
}
