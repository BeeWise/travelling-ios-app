//
//  PlacesTaskTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

@testable import Travelling
import XCTest
import UIKit

class PlacesTaskTests: XCTestCase {
    var sut: PlacesTask!
    
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
        self.sut = PlacesTask(environment: .memory)
    }
    
    // MARK: - Tests
    
    func testFetchPlacesForProduction() {
        self.shouldTestFetchPlacesForEnvironment(environment: .production, operationClass: GetPlacesOperation.self)
    }
    
    func testFetchPlacesForDevelopment() {
        self.shouldTestFetchPlacesForEnvironment(environment: .development, operationClass: GetPlacesOperation.self)
    }
    
    func testFetchPlacesForMemory() {
        self.shouldTestFetchPlacesForEnvironment(environment: .memory, operationClass: GetPlacesLocalOperation.self)
    }
    
    private func shouldTestFetchPlacesForEnvironment(environment: TaskEnvironment, operationClass: AnyClass) {
        self.sut.environment = environment
        let operationQueueSpy = OperationQueueSpy()
        self.sut.fetchPlacesOperationQueue = operationQueueSpy
        self.sut.fetchPlaces(model: PlacesTaskModels.Fetch.Request(page: 0, limit: 0), completionHandler: { _ in })
        XCTAssertTrue(operationQueueSpy.addOperationCalled)
        XCTAssertTrue(operationQueueSpy.addedOperation.isKind(of: operationClass))
    }
}
