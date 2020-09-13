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
}
