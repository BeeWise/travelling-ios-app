//
//  GetPlaceCommentsLocalOperationTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/10/2020.
//

@testable import Travelling
import XCTest
import UIKit

class GetPlaceCommentsLocalOperationTests: XCTestCase {
    var sut: GetPlaceCommentsLocalOperation!
    var value: [Comment]!
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
        let model = GetPlaceCommentsOperationModels.Request(placeId: "placeId", page: 0, limit: 0)
        self.sut = GetPlaceCommentsLocalOperation(model: model, completionHandler: { result in
            switch result {
                case .success(let value): self.value = value.comments; break
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
