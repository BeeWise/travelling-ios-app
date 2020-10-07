//
//  MainViewController+DisplayLogic.swift
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

protocol MainDisplayLogic: class {
    func displaySetupScenes(viewModel: MainModels.ScenesSetup.ViewModel)
    func displaySelectScene(viewModel: MainModels.SceneSelection.ViewModel)
    
    func displayNavigateToOnboarding()
    func displayDismissOnboarding()
    
    func displayLoginUser(viewModel: MainModels.UserLogin.ViewModel)
    func displayLogoutUser()
}

extension MainViewController: MainDisplayLogic {
    func displaySetupScenes(viewModel: MainModels.ScenesSetup.ViewModel) {
        DispatchQueue.main.async {
            self.setViewControllers(self.viewControllersFor(indices: viewModel.indices), animated: false)
        }
    }
    
    func displaySelectScene(viewModel: MainModels.SceneSelection.ViewModel) {
        DispatchQueue.main.async {
            self.selectedIndex = viewModel.index
        }
    }
    
    func displayNavigateToOnboarding() {
        DispatchQueue.main.async {
            self.router?.navigateToOnboarding()
        }
    }
    
    func displayDismissOnboarding() {
        DispatchQueue.main.async {
            self.router?.dismissViewController()
        }
    }
    
    func displayLoginUser(viewModel: MainModels.UserLogin.ViewModel) {
        DispatchQueue.main.async {
            self.myProfileViewController?.shouldLoginUser(user: viewModel.user)
        }
    }
    
    func displayLogoutUser() {
        DispatchQueue.main.async {
            self.myProfileViewController?.shouldLogoutUser()
        }
    }
}

// MARK: - Auxiliary

extension MainViewController {
    private func viewControllersFor(indices: [Int]) -> [UIViewController] {
        var controllers: [UIViewController] = []
        for index in indices {
            switch index {
                case MainModels.Scenes.explore.rawValue: controllers.append(UINavigationController(rootViewController: self.exploreViewController)); break
                case MainModels.Scenes.myFavorites.rawValue: controllers.append(UINavigationController(rootViewController: self.myFavoritesViewController)); break
                case MainModels.Scenes.myProfile.rawValue: controllers.append(UINavigationController(rootViewController: self.myProfileViewController)); break
                default: break
            }
        }
        return controllers
    }
}
