//
//  AuthenticationTaskTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

@testable import Travelling
import XCTest
import UIKit

class AuthenticationTaskTests: XCTestCase {
    var sut: AuthenticationTask!
    
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
        self.sut = AuthenticationTask(environment: .memory)
    }
    
    // MARK: - Tests
    
    func testLogoutUserForProduction() {
        self.shouldTestLogoutUserForEnvironment(environment: .production, operationClass: LogoutUserOperation.self)
    }
    
    func testLogoutUserForDevelopment() {
        self.shouldTestLogoutUserForEnvironment(environment: .development, operationClass: LogoutUserOperation.self)
    }
    
    func testLogoutUserForMemory() {
        self.shouldTestLogoutUserForEnvironment(environment: .memory, operationClass: LogoutUserLocalOperation.self)
    }
    
    private func shouldTestLogoutUserForEnvironment(environment: TaskEnvironment, operationClass: AnyClass) {
        self.sut.environment = environment
        let operationQueueSpy = OperationQueueSpy()
        self.sut.logoutUserOperationQueue = operationQueueSpy
        self.sut.logoutUser(model: AuthenticationTaskModels.LogoutUser.Request(userId: "userId"), completionHandler: { _ in })
        XCTAssertTrue(operationQueueSpy.addOperationCalled)
        XCTAssertTrue(operationQueueSpy.addedOperation.isKind(of: operationClass))
    }
}
