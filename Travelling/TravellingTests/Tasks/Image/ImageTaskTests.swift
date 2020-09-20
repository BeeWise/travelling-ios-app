//
//  ImageTaskTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

@testable import Travelling
import XCTest
import UIKit

class ImageTaskTests: XCTestCase {
    var sut: ImageTask!
    
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
        self.sut = ImageTask(environment: .memory)
    }
    
    // MARK: - Tests
    
    func testFetchImageForProduction() {
        self.shouldTestFetchImageForEnvironment(environment: .production, operationClass: GetImageOperation.self)
    }
    
    func testFetchImageForDevelopment() {
        self.shouldTestFetchImageForEnvironment(environment: .development, operationClass: GetImageOperation.self)
    }
    
    func testFetchImageForMemory() {
        self.shouldTestFetchImageForEnvironment(environment: .memory, operationClass: GetImageLocalOperation.self)
    }
    
    private func shouldTestFetchImageForEnvironment(environment: TaskEnvironment, operationClass: AnyClass) {
        self.sut.environment = environment
        let operationQueueSpy = OperationQueueSpy()
        self.sut.fetchImageOperationQueue = operationQueueSpy
        self.sut.fetchImage(model: ImageTaskModels.Fetch.Request(imageName: "imageName"), completionHandler: { _ in })
        XCTAssertTrue(operationQueueSpy.addOperationCalled)
        XCTAssertTrue(operationQueueSpy.addedOperation.isKind(of: operationClass))
    }
}
