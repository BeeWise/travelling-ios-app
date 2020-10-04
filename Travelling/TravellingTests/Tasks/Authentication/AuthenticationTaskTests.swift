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
    
    // MARK: - Logout tests
    
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
    
    // MARK: - Login tests
    
    func testLoginUserForProduction() {
        self.shouldTestLoginUserForEnvironment(environment: .production, operationClass: LoginUserOperation.self)
    }
    
    func testLoginUserForDevelopment() {
        self.shouldTestLoginUserForEnvironment(environment: .development, operationClass: LoginUserOperation.self)
    }
    
    func testLoginUserForMemory() {
        self.shouldTestLoginUserForEnvironment(environment: .memory, operationClass: LoginUserLocalOperation.self)
    }
    
    private func shouldTestLoginUserForEnvironment(environment: TaskEnvironment, operationClass: AnyClass) {
        self.sut.environment = environment
        let operationQueueSpy = OperationQueueSpy()
        self.sut.loginUserOperationQueue = operationQueueSpy
        self.sut.loginUser(model: AuthenticationTaskModels.LoginUser.Request(account: "account", password: "password"), completionHandler: { _ in })
        XCTAssertTrue(operationQueueSpy.addOperationCalled)
        XCTAssertTrue(operationQueueSpy.addedOperation.isKind(of: operationClass))
    }
    
    // MARK: - Sign up tests
    
    func testSignUpUserForProduction() {
        self.shouldTestSignUpUserForEnvironment(environment: .production, operationClass: SignUpUserOperation.self)
    }
    
    func testSignUpUserForDevelopment() {
        self.shouldTestSignUpUserForEnvironment(environment: .development, operationClass: SignUpUserOperation.self)
    }
    
    func testSignUpUserForMemory() {
        self.shouldTestSignUpUserForEnvironment(environment: .memory, operationClass: SignUpUserLocalOperation.self)
    }
    
    private func shouldTestSignUpUserForEnvironment(environment: TaskEnvironment, operationClass: AnyClass) {
        self.sut.environment = environment
        let operationQueueSpy = OperationQueueSpy()
        self.sut.signUpUserOperationQueue = operationQueueSpy
        self.sut.signUpUser(model: AuthenticationTaskModels.SignUpUser.Request(email: "email", username: "username", password: "password", firstName: "first", lastName: "last", description: "description", photoBase64: nil), completionHandler: { _ in })
        XCTAssertTrue(operationQueueSpy.addOperationCalled)
        XCTAssertTrue(operationQueueSpy.addedOperation.isKind(of: operationClass))
    }
    
    // MARK: - Forgot password tests
    
    func testForgotPasswordForProduction() {
        self.shouldTestForgotPasswordForEnvironment(environment: .production, operationClass: ForgotPasswordOperation.self)
    }
    
    func testForgotPasswordForDevelopment() {
        self.shouldTestForgotPasswordForEnvironment(environment: .development, operationClass: ForgotPasswordOperation.self)
    }
    
    func testForgotPasswordForMemory() {
        self.shouldTestForgotPasswordForEnvironment(environment: .memory, operationClass: ForgotPasswordLocalOperation.self)
    }
    
    private func shouldTestForgotPasswordForEnvironment(environment: TaskEnvironment, operationClass: AnyClass) {
        self.sut.environment = environment
        let operationQueueSpy = OperationQueueSpy()
        self.sut.forgotPasswordOperationQueue = operationQueueSpy
        self.sut.forgotPassword(model: AuthenticationTaskModels.ForgotPassword.Request(email: "email"), completionHandler: { _ in })
        XCTAssertTrue(operationQueueSpy.addOperationCalled)
        XCTAssertTrue(operationQueueSpy.addedOperation.isKind(of: operationClass))
    }
}
