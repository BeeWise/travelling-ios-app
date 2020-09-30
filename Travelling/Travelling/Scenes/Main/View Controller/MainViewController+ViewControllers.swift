//
//  MainViewController+ViewControllers.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

import Foundation
import UIKit

// MARK: - View controllers setup

extension MainViewController {
    func setupViewControllers() {
        self.setupExploreViewController()
        self.setupMyFavoritesViewController()
        self.setupMyProfileViewController()
    }
}

// MARK: - Explore scene

extension MainViewController {
    func setupExploreViewController() {
        self.exploreViewController = ExploreViewController()
        self.exploreViewController.tabBarItem = self.exploreTabBarItem()
    }
    
    private func exploreTabBarItem() -> UITabBarItem {
        let item = UITabBarItem(title: MainLocalization.shared.exploreTabTitle, image: ApplicationStyle.images.exploreTabIcon, selectedImage: ApplicationStyle.images.exploreTabIcon)
        self.setupTabBarItem(item: item)
        return item
    }
}

// MARK: - MyFavorites scene

extension MainViewController {
    func setupMyFavoritesViewController() {
        self.myFavoritesViewController = UIViewController()
        self.myFavoritesViewController.tabBarItem = self.myFavoritesTabBarItem()
    }
    
    private func myFavoritesTabBarItem() -> UITabBarItem {
        let item = UITabBarItem(title: MainLocalization.shared.myFavoritesTabTitle, image: ApplicationStyle.images.myFavoritesTabIcon, selectedImage: ApplicationStyle.images.myFavoritesTabIcon)
        self.setupTabBarItem(item: item)
        return item
    }
}

// MARK: - MyProfile scene

extension MainViewController: MyProfileViewControllerDelegate {
    func setupMyProfileViewController() {
        self.myProfileViewController = MyProfileViewController()
        self.myProfileViewController?.delegate = self
        self.myProfileViewController.tabBarItem = self.myProfileTabBarItem()
    }
    
    private func myProfileTabBarItem() -> UITabBarItem {
        let item = UITabBarItem(title: MainLocalization.shared.myProfileTabTitle, image: ApplicationStyle.images.myProfileTabIcon, selectedImage: ApplicationStyle.images.myProfileTabIcon)
        self.setupTabBarItem(item: item)
        return item
    }
    
    func myProfileViewControllerDidLogoutUser(viewController: MyProfileViewController?) {
        self.interactor?.shouldSelectInitialScene()
    }
}
