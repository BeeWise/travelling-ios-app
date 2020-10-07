//
//  MyProfilePresenter.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 27/09/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MyProfilePresentationLogic {
    func presentWillFetchUser()
    func presentDidFetchUser()
    func presentUser(response: MyProfileModels.UserPresentation.Response)
    func presentResetUser()
    
    func presentWillFetchImage(response: MyProfileModels.ImageFetching.Response)
    func presentDidFetchImage(response: MyProfileModels.ImageFetching.Response)
    func presentImage(response: MyProfileModels.ImagePresentation.Response)
    func presentPlaceholderImage(response: MyProfileModels.ImagePresentation.Response)
    
    func presentWillLogoutUser()
    func presentDidLogoutUser()
    func presentLoggedOutUser()
    
    func presentNavigateToReportIssue()
    
    func presentErrorState()
    func presentRemoveErrorState()
    
    func presentErrorAlert(response: MyProfileModels.ErrorAlertPresentation.Response)
    
    func presentNavigateToFullscreenImage(response: MyProfileModels.FullscreenImageNavigation.Response)
}

class MyProfilePresenter: MyProfilePresentationLogic {
    weak var displayer: MyProfileDisplayLogic?
    
    func presentWillFetchUser() {
        self.displayer?.displayWillFetchUser()
    }
    
    func presentDidFetchUser() {
        self.displayer?.displayDidFetchUser()
    }
    
    func presentUser(response: MyProfileModels.UserPresentation.Response) {
        self.displayer?.displayUser(viewModel: MyProfileModels.UserPresentation.ViewModel(items: self.displayedItems(user: response.user)))
    }
    
    func presentResetUser() {
        self.displayer?.displayResetUser()
    }
    
    func presentWillFetchImage(response: MyProfileModels.ImageFetching.Response) {
        self.displayer?.displayWillFetchImage(viewModel: MyProfileModels.ImageFetching.ViewModel(model: response.model))
    }
    
    func presentDidFetchImage(response: MyProfileModels.ImageFetching.Response) {
        self.displayer?.displayDidFetchImage(viewModel: MyProfileModels.ImageFetching.ViewModel(model: response.model))
    }
    
    func presentImage(response: MyProfileModels.ImagePresentation.Response) {
        self.displayer?.displayImage(viewModel: MyProfileModels.ImagePresentation.ViewModel(model: response.model, image: response.image, contentMode: .scaleAspectFill))
    }
    
    func presentPlaceholderImage(response: MyProfileModels.ImagePresentation.Response) {
        let image = MyProfileStyle.shared.informationCellModel.avatarPlaceholderImage
        self.displayer?.displayImage(viewModel: MyProfileModels.ImagePresentation.ViewModel(model: response.model, image: image, contentMode: .center))
    }
    
    func presentWillLogoutUser() {
        self.displayer?.displayWillLogoutUser()
    }
    
    func presentDidLogoutUser() {
        self.displayer?.displayDidLogoutUser()
    }
    
    func presentLoggedOutUser() {
        self.displayer?.displayLoggedOutUser()
    }
    
    func presentNavigateToReportIssue() {
        let recipient = BundleConfiguration.string(for: BundleConfiguration.Keys.reportIssueRecipientEmail)
        let subject = MyProfileLocalization.shared.reportIssueEmailSubject(applicationName: Bundle.main.applicationName, applicationVersion: Bundle.main.versionNumber)
        self.displayer?.displayNavigateToEmail(viewModel: MyProfileModels.EmailNavigation.ViewModel(recipient: recipient, subject: subject))
    }
    
    func presentErrorState() {
        let image = MyProfileStyle.shared.errorStateViewModel.image
        let text = MyProfileLocalization.shared.errorStateText.attributed(attributes: MyProfileStyle.shared.errorStateViewModel.textAttributes())
        self.displayer?.displayErrorState(viewModel: MyProfileModels.ErrorStatePresentation.ViewModel(image: image, text: text))
    }
    
    func presentRemoveErrorState() {
        self.displayer?.displayRemoveErrorState()
    }
    
    func presentErrorAlert(response: MyProfileModels.ErrorAlertPresentation.Response) {
        let message = MyProfileLocalization.shared.errorAlertMessage
        let cancelTitle = MyProfileLocalization.shared.errorAlertCancelTitle
        self.displayer?.displayErrorAlert(viewModel: MyProfileModels.ErrorAlertPresentation.ViewModel(title: nil, message: message, cancelTitle: cancelTitle))
    }
    
    func presentNavigateToFullscreenImage(response: MyProfileModels.FullscreenImageNavigation.Response) {
        self.displayer?.displayNavigateToFullscreenImage(viewModel: MyProfileModels.FullscreenImageNavigation.ViewModel(imageName: response.imageName))
    }
}

// MARK: - Displayed items

extension MyProfilePresenter {
    private func displayedItems(user: User) -> [MyProfileModels.DisplayedItem] {
        var items: [MyProfileModels.DisplayedItem] = []
        items.append(self.displayedUserItem(user: user))
        items.append(self.displayedLogoutItem())
        items.append(self.displayedReportIssueItem())
        items.append(self.displayedVersionItem())
        return items
    }
    
    private func displayedUserItem(user: User) -> MyProfileModels.DisplayedItem {
        let model = MyProfileModels.UserModel()
        model.name = self.displayedName(user: user).attributed(attributes: MyProfileStyle.shared.informationCellModel.nameAttributes())
        model.title = user.username?.attributed(attributes: MyProfileStyle.shared.informationCellModel.titleAttributes())
        model.description = user.description?.attributed(attributes: MyProfileStyle.shared.informationCellModel.descriptionAttributes())
        model.imageDominantColor = user.photo?.imageDominantColor?.hexColor()
        model.imageName = user.photo?.imageName
        return MyProfileModels.DisplayedItem(type: .user, model: model)
    }
    
    private func displayedName(user: User) -> String {
        let firstName = user.firstName ?? ""
        let lastName = user.lastName ?? ""
        return String(format: "%@ %@", firstName, lastName)
    }
    
    private func displayedLogoutItem() -> MyProfileModels.DisplayedItem {
        let model = MyProfileModels.TitleModel(title: MyProfileLocalization.shared.logoutTitle.attributed(attributes: MyProfileStyle.shared.titleCellModel.titleAttributes()), isSelectable: true)
        return MyProfileModels.DisplayedItem(type: .logout, model: model)
    }
    
    private func displayedReportIssueItem() -> MyProfileModels.DisplayedItem {
        let model = MyProfileModels.TitleModel(title: MyProfileLocalization.shared.reportIssueTitle.attributed(attributes: MyProfileStyle.shared.titleCellModel.titleAttributes()), isSelectable: true)
        return MyProfileModels.DisplayedItem(type: .reportIssue, model: model)
    }
    
    private func displayedVersionItem() -> MyProfileModels.DisplayedItem {
        let version = Bundle.main.versionNumber
        let model = MyProfileModels.TitleModel(title: MyProfileLocalization.shared.versionTitle(version: version).attributed(attributes: MyProfileStyle.shared.titleCellModel.versionAttributes()), isSelectable: false)
        return MyProfileModels.DisplayedItem(type: .version, model: model)
    }
}
