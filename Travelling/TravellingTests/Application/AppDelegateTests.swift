//
//  AppDelegateTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

@testable import Travelling
import XCTest

class AppDelegateTests: BaseTestCase {
    var sut: AppDelegate!
    var interactorSpy: AppBusinessLogicSpy!
    
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
        self.sut = AppDelegate()
        
        self.interactorSpy = AppBusinessLogicSpy()
        self.sut.interactor = self.interactorSpy
    }
        
    // MARK: - Display logic tests
    
    func testDisplaySetupWindowShouldSetupWindow() {
        self.sut.window = nil
        
        let frame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let backgroundColor: UIColor = .green
        self.sut.displaySetupWindow(viewModel: AppModels.WindowSetup.ViewModel(frame: frame, backgroundColor: backgroundColor))
        self.waitForMainQueue()
        XCTAssertNotNil(self.sut.window)
        XCTAssertEqual(self.sut.window?.frame, frame)
        XCTAssertEqual(self.sut.window?.backgroundColor, backgroundColor)
    }
}
