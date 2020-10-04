//
//  FullscreenImageViewControllerTests.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling
import XCTest

class FullscreenImageViewControllerTests: XCTestCase {
    var sut: FullscreenImageViewController!
    var interactorSpy: FullscreenImageBusinessLogicSpy!
    var routerSpy: FullscreenImageRoutingLogicSpy!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        self.window = UIWindow()
        self.setupFullscreenImageViewController()
    }
    
    override func tearDown() {
        self.window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupFullscreenImageViewController() {
        self.sut = FullscreenImageViewController()
        
        self.interactorSpy = FullscreenImageBusinessLogicSpy()
        self.sut.interactor = self.interactorSpy
        
        self.routerSpy = FullscreenImageRoutingLogicSpy()
        self.sut.router = self.routerSpy
    }
    
    func loadView() {
        self.window.addSubview(self.sut.view)
        RunLoop.current.run(until: Date())
    }
    
    private func waitForMainQueue() {
        let waitExpectation = expectation(description: "Waiting for main queue.")
        DispatchQueue.main.async {
            waitExpectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
    
    // MARK: - Business logic tests
    
    func testShouldSetImageWhenTheViewDidLoad() {
        self.loadView()
        XCTAssertTrue(self.interactorSpy.shouldSetImageCalled)
    }
    
    func testShouldFetchImageWhenTheViewDidLoad() {
        self.loadView()
        XCTAssertTrue(self.interactorSpy.shouldFetchImageCalled)
    }
    
    // MARK: - Routing logic tests
    
    func testTouchUpInsideDismissButtonShouldAskTheRouterToDismissViewController() {
        self.sut.touchUpInsideDismissButton()
        XCTAssertTrue(self.routerSpy.dismissViewControllerCalled)
    }
    
    // MARK: - Display logic tests
    
    func testDisplayWillFetchImage() {
        self.loadView()
        self.sut.displayWillFetchImage()
        self.waitForMainQueue()
        XCTAssertEqual(self.sut.imageView?.activityIndicatorView?.isHidden, false)
    }
    
    func testDisplayDidFetchImage() {
        self.loadView()
        self.sut.displayDidFetchImage()
        self.waitForMainQueue()
        XCTAssertEqual(self.sut.imageView?.activityIndicatorView?.isHidden, true)
    }
    
    func testDisplayImage() {
        self.loadView()
        self.sut.imageView.image = nil
        self.sut.imageView.contentMode = .center
        let image = UIImage()
        let contentMode = UIView.ContentMode.scaleAspectFill
        self.sut.displayImage(viewModel: FullscreenImageModels.ImagePresentation.ViewModel(image: image, contentMode: contentMode))
        self.waitForMainQueue()
        XCTAssertEqual(self.sut.imageView.image, image)
        XCTAssertEqual(self.sut.imageView.contentMode, contentMode)
    }
}
