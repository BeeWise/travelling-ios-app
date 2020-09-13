//
//  AppPresenterTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

@testable import Travelling
import XCTest

class AppPresenterTests: XCTestCase {
    var sut: AppPresenter!
    var displayerSpy: AppDisplayLogicSpy!
    
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
        self.sut = AppPresenter()
        
        self.displayerSpy = AppDisplayLogicSpy()
        self.sut.displayer = self.displayerSpy
    }
    
    // MARK: - Tests
    
    func testPresentSetupWindowShouldAskTheDisplayerToDisplaySetupWindow() {
        self.sut.presentSetupWindow()
        XCTAssertTrue(self.displayerSpy.displaySetupWindowCalled)
    }
}
