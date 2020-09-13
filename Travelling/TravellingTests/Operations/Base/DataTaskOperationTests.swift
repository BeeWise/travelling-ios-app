//
//  DataTaskOperationTests.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

@testable import Travelling
import XCTest
import UIKit

class DataTaskOperationTests: XCTestCase {
    struct Model: Codable, Equatable {
        let id: String = UUID().uuidString
    }
    
    var sut: DataTaskOperation<Model>!
    var value: Model!
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
        self.sut = DataTaskOperation(model: "", completionHandler: { result in
            switch result {
                case .success(let value): self.value = value; break
                case .failure(let error): self.error = error; break
            }
        })
    }
    
    // MARK: - Tests
    
    func testShouldCancelOperationShouldReturnTrueWhenItIsCancelled() {
        self.sut.cancel()
        XCTAssertTrue(self.sut.shouldCancelOperation())
        XCTAssertEqual(self.error, OperationError.operationCancelled)
    }
    
    func testShouldCancelOperationShouldReturnFalseWhenItIsNotCancelled() {
        XCTAssertFalse(self.sut.shouldCancelOperation())
    }
}
