//
//  BaseTestCase.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 12/09/2020.
//

@testable import Travelling
import XCTest

class BaseTestCase: XCTestCase {
    func waitForMainQueue() {
        let waitExpectation = expectation(description: "Waiting for main queue.")
        DispatchQueue.main.async {
            waitExpectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
}
