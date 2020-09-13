//
//  AppInteractorTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

@testable import Travelling
import XCTest

class AppInteractorTests: XCTestCase {
    var sut: AppInteractor!
    var presenterSpy: AppPresentationLogicSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        self.setupSubjectUnderTest()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupSubjectUnderTest() {
        self.sut = AppInteractor()
        
        self.presenterSpy = AppPresentationLogicSpy()
        self.sut.presenter = self.presenterSpy
    }
    
    // MARK: - Tests
    
    func testShouldSetupWindowShouldAskThePresenterToPresentSetupWindow() {
        self.sut.shouldSetupWindow()
        XCTAssertTrue(self.presenterSpy.presentSetupWindowCalled)
    }
}
