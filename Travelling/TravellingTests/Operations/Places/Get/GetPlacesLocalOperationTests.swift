//
//  GetPlacesLocalOperationTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

@testable import Travelling
import XCTest
import UIKit

class GetPlacesLocalOperationTests: XCTestCase {
    var sut: GetPlacesLocalOperation!
    var value: [Place]!
    var error: OperationError!
    
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
        let model = GetPlacesOperationModels.Request(page: 0, limit: 0)
        self.sut = GetPlacesLocalOperation(model: model, completionHandler: { result in
            switch result {
                case .success(let value): self.value = value.places; break
                case .failure(let error): self.error = error; break
            }
        })
        self.sut.delay = 0
    }
    
    func waitForQueue(delay: Int = 10) {
        let waitExpectation = expectation(description: "Waiting for queue.")
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(delay)) {
            waitExpectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
    
    // MARK: - Tests
    
    func testMainWhenItIsCancelled() {
        self.sut.cancel()
        self.sut.main()
        XCTAssertEqual(self.error, OperationError.operationCancelled)
    }
    
    func testMainWhenItIsFailed() {
        self.sut.shouldFail = true
        self.sut.main()
        self.waitForQueue()
        XCTAssertEqual(self.error, OperationError.noDataAvailable)
    }
    
    func testMainWhenItIsNotFailed() {
        let count = 10
        self.sut.count = count
        self.sut.shouldFail = false
        self.sut.main()
        self.waitForQueue()
        XCTAssertNotNil(self.value)
        XCTAssertEqual(self.value.count, count)
    }
}
