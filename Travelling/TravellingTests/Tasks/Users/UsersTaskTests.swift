//
//  UsersTaskTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

@testable import Travelling
import XCTest
import UIKit

class UsersTaskTests: XCTestCase {
    var sut: UsersTask!
    
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
        self.sut = UsersTask(environment: .memory)
    }
    
    // MARK: - Tests
    
    func testFetchUserForProduction() {
        self.shouldTestFetchUserForEnvironment(environment: .production, operationClass: GetUserOperation.self)
    }
    
    func testFetchUserForDevelopment() {
        self.shouldTestFetchUserForEnvironment(environment: .development, operationClass: GetUserOperation.self)
    }
    
    func testFetchUserForMemory() {
        self.shouldTestFetchUserForEnvironment(environment: .memory, operationClass: GetUserLocalOperation.self)
    }
    
    private func shouldTestFetchUserForEnvironment(environment: TaskEnvironment, operationClass: AnyClass) {
        self.sut.environment = environment
        let operationQueueSpy = OperationQueueSpy()
        self.sut.fetchUserOperationQueue = operationQueueSpy
        self.sut.fetchUser(model: UsersTaskModels.FetchUser.Request(userId: "userId"), completionHandler: { _ in })
        XCTAssertTrue(operationQueueSpy.addOperationCalled)
        XCTAssertTrue(operationQueueSpy.addedOperation.isKind(of: operationClass))
    }
}
