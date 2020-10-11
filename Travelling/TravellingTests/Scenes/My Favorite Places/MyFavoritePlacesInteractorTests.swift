//
//  MyFavoritePlacesInteractorTests.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 11/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling
import XCTest

class MyFavoritePlacesInteractorTests: XCTestCase {
    var sut: MyFavoritePlacesInteractor!
    var presenterSpy: MyFavoritePlacesPresentationLogicSpy!
    var workerSpy: MyFavoritePlacesWorkerSpy!
  
    // MARK: - Test lifecycle
  
    override func setUp() {
        super.setUp()
        self.setupMyFavoritePlacesInteractor()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    // MARK: - Test setup
  
    func setupMyFavoritePlacesInteractor() {
        self.sut = MyFavoritePlacesInteractor()
        
        self.presenterSpy = MyFavoritePlacesPresentationLogicSpy()
        self.sut.presenter = self.presenterSpy
        
        self.workerSpy = MyFavoritePlacesWorkerSpy(delegate: self.sut)
        self.sut.worker = self.workerSpy
    }
    
    // MARK: - Tests
  
    
}
