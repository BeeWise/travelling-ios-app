//
//  SignUpPresenterTests.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 06/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling
import XCTest

class SignUpPresenterTests: XCTestCase {
    var sut: SignUpPresenter!
    var displayerSpy: SignUpDisplayLogicSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        self.setupSignUpPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupSignUpPresenter() {
        self.sut = SignUpPresenter()
        
        self.displayerSpy = SignUpDisplayLogicSpy()
        self.sut.displayer = self.displayerSpy
    }
    
    // MARK: - Tests
    
    func testPresentSetupItems() {
        self.sut.presentSetupItems()
        XCTAssertTrue(self.displayerSpy.displaySetupItemsCalled)
    }
    
    func testPresentUpdateItem() {
        self.sut.presentUpdateItem(response: SignUpModels.UpdateItem.Response(text: "email", type: SignUpModels.ItemType.email))
        XCTAssertTrue(self.displayerSpy.displayUpdateItemCalled)
    }
    
    func testPresentValidationError() {
        self.sut.presentValidationError(response: SignUpModels.ValidateItem.Response(type: SignUpModels.ItemType.email, displayError: true))
        XCTAssertTrue(self.displayerSpy.displayValidationErrorCalled)
    }
    
    func testPresentActivateTextField() {
        self.sut.presentActivateTextField(response: SignUpModels.ActivateTextField.Response(type: .email))
        XCTAssertTrue(self.displayerSpy.displayActivateTextFieldCalled)
    }
    
    func testPresentEnableItem() {
        self.sut.presentEnableItem(response: SignUpModels.EnableItem.Response(type: SignUpModels.ItemType.email))
        XCTAssertTrue(self.displayerSpy.displayEnableItemCalled)
    }
    
    func testPresentDisableItem() {
        self.sut.presentDisableItem(response: SignUpModels.EnableItem.Response(type: SignUpModels.ItemType.email))
        XCTAssertTrue(self.displayerSpy.displayDisableItemCalled)
    }
    
    func testPresentPhotoLibraryAlert() {
        self.sut.presentPhotoLibraryAlert(response: SignUpModels.SourceView.Response(sourceView: UIView()))
        XCTAssertTrue(self.displayerSpy.displayPhotoLibraryAlertCalled)
    }
    
    func testPresentPhotoLibraryCameraAlert() {
        self.sut.presentPhotoLibraryCameraAlert(response: SignUpModels.SourceView.Response(sourceView: UIView()))
        XCTAssertTrue(self.displayerSpy.displayPhotoLibraryCameraAlertCalled)
    }
    
    func testPresentPhotoLibraryRemovePhotoAlert() {
        self.sut.presentPhotoLibraryRemovePhotoAlert(response: SignUpModels.SourceView.Response(sourceView: UIView()))
        XCTAssertTrue(self.displayerSpy.displayPhotoLibraryRemovePhotoAlertCalled)
    }
    
    func testPresentPhotoLibraryCameraRemovePhotoAlert() {
        self.sut.presentPhotoLibraryCameraRemovePhotoAlert(response: SignUpModels.SourceView.Response(sourceView: UIView()))
        XCTAssertTrue(self.displayerSpy.displayPhotoLibraryCameraRemovePhotoAlertCalled)
    }
    
    func testPresentCameraAlert() {
        self.sut.presentCameraAlert(response: SignUpModels.SourceView.Response(sourceView: UIView()))
        XCTAssertTrue(self.displayerSpy.displayCameraAlertCalled)
    }
    
    func testPresentCameraRemovePhotoAlert() {
        self.sut.presentCameraRemovePhotoAlert(response: SignUpModels.SourceView.Response(sourceView: UIView()))
        XCTAssertTrue(self.displayerSpy.displayCameraRemovePhotoAlertCalled)
    }
    
    func testPresentNavigateToPhotoLibrary() {
        self.sut.presentNavigateToPhotoLibrary(response: SignUpModels.SourceView.Response(sourceView: UIView()))
        XCTAssertTrue(self.displayerSpy.displayNavigateToPhotoLibraryCalled)
    }
    
    func testPresentNavigateToCamera() {
        self.sut.presentNavigateToCamera(response: SignUpModels.SourceView.Response(sourceView: UIView()))
        XCTAssertTrue(self.displayerSpy.displayNavigateToCameraCalled)
    }
    
    func testPresentUpdateImageItem() {
        self.sut.presentUpdateImageItem(response: SignUpModels.UpdateImageItem.Response(image: UIImage(), type: SignUpModels.ItemType.photo))
        XCTAssertTrue(self.displayerSpy.displayUpdateImageItemCalled)
    }
    
    func testPresentUpdatePlaceholderImageItem() {
        self.sut.presentUpdatePlaceholderImageItem(response: SignUpModels.UpdatePlaceholderImageItem.Response(type: SignUpModels.ItemType.photo))
        XCTAssertTrue(self.displayerSpy.displayUpdateImageItemCalled)
    }
    
    func testPresentLoadingItem() {
        self.sut.presentLoadingItem(response: SignUpModels.LoadingItem.Response(type: SignUpModels.ItemType.signUp))
        XCTAssertTrue(self.displayerSpy.displayLoadingItemCalled)
    }
    
    func testPresentNotLoadingItem() {
        self.sut.presentNotLoadingItem(response: SignUpModels.LoadingItem.Response(type: SignUpModels.ItemType.signUp))
        XCTAssertTrue(self.displayerSpy.displayNotLoadingItemCalled)
    }
    
    func testPresentEnableUserInteraction() {
        self.sut.presentEnableUserInteraction()
        XCTAssertTrue(self.displayerSpy.displayEnableUserInteractionCalled)
    }
    
    func testPresentDisableUserInteraction() {
        self.sut.presentDisableUserInteraction()
        XCTAssertTrue(self.displayerSpy.displayDisableUserInteractionCalled)
    }
    
    func testPresentUserDetails() {
        self.sut.presentUserDetails(response: SignUpModels.SignUpUser.Response(user: User(id: "userId")))
        XCTAssertTrue(self.displayerSpy.displayUserDetailsCalled)
    }
    
    func testPresentErrorDetails() {
        self.sut.presentErrorDetails(response: SignUpModels.SignUpError.Response(error: OperationError.noDataAvailable))
        XCTAssertTrue(self.displayerSpy.displayErrorDetailsCalled)
    }
}
