//
//  LoginWorkerTests.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling
import XCTest

class LoginWorkerTests: XCTestCase {
    var sut: LoginWorker!
    var delegateSpy: LoginWorkerDelegateSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        self.setupLoginWorker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupLoginWorker() {
        self.delegateSpy = LoginWorkerDelegateSpy()
        self.sut = LoginWorker(delegate: self.delegateSpy)
    }
    
    // MARK: - Tests
    
    
}
