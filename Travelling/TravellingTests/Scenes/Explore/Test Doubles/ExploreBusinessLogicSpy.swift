//
//  ExploreBusinessLogicSpy.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling

class ExploreBusinessLogicSpy: ExploreBusinessLogic {
    var shouldFetchItemsCalled: Bool = false
    var shouldFetchImageCalled: Bool = false
    
    func shouldFetchItems() {
        self.shouldFetchItemsCalled = true
    }
    
    func shouldFetchImage(request: ExploreModels.ImageFetching.Request) {
        self.shouldFetchImageCalled = true
    }
}
