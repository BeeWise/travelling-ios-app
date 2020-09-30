//
//  TaskConfiguratorTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

@testable import Travelling
import XCTest
import UIKit

class TaskConfiguratorTests: XCTestCase {
    var sut: TaskConfigurator!
    
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
        self.sut = TaskConfigurator()
    }
    
    // MARK: - Places task
    
    func testPlacesTaskForProduction() {
        self.shouldTestPlacesTaskForEnvironment(environment: .production)
    }
    
    func testPlacesTaskForDevelopment() {
        self.shouldTestPlacesTaskForEnvironment(environment: .development)
    }
    
    func testPlacesTaskForMemory() {
        self.shouldTestPlacesTaskForEnvironment(environment: .memory)
    }
    
    private func shouldTestPlacesTaskForEnvironment(environment: TaskEnvironment) {
        self.sut.environment = environment
        let task = self.sut.placesTask()
        XCTAssertEqual(task.environment, environment)
    }
    
    // MARK: - Image task
    
    func testImageTaskForProduction() {
        self.shouldTestImageTaskForEnvironment(environment: .production)
    }
    
    func testImageTaskForDevelopment() {
        self.shouldTestImageTaskForEnvironment(environment: .development)
    }
    
    func testImageTaskForMemory() {
        self.shouldTestImageTaskForEnvironment(environment: .memory)
    }
    
    private func shouldTestImageTaskForEnvironment(environment: TaskEnvironment) {
        self.sut.environment = environment
        let task = self.sut.imageTask()
        XCTAssertEqual(task.environment, environment)
    }
    
    // MARK: - Users task
    
    func testUsersTaskForProduction() {
        self.shouldTestUsersTaskForEnvironment(environment: .production)
    }
    
    func testUsersTaskForDevelopment() {
        self.shouldTestUsersTaskForEnvironment(environment: .development)
    }
    
    func testUsersTaskForMemory() {
        self.shouldTestUsersTaskForEnvironment(environment: .memory)
    }
    
    private func shouldTestUsersTaskForEnvironment(environment: TaskEnvironment) {
        self.sut.environment = environment
        let task = self.sut.usersTask()
        XCTAssertEqual(task.environment, environment)
    }
    
    // MARK: - Authentication task
    
    func testAuthenticationTaskForProduction() {
        self.shouldTestAuthenticationTaskForEnvironment(environment: .production)
    }
    
    func testAuthenticationTaskForDevelopment() {
        self.shouldTestAuthenticationTaskForEnvironment(environment: .development)
    }
    
    func testAuthenticationTaskForMemory() {
        self.shouldTestAuthenticationTaskForEnvironment(environment: .memory)
    }
    
    private func shouldTestAuthenticationTaskForEnvironment(environment: TaskEnvironment) {
        self.sut.environment = environment
        let task = self.sut.authenticationTask()
        XCTAssertEqual(task.environment, environment)
    }
}
