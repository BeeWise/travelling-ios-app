//
//  PlaceCommentsWorkerDelegateSpy.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/10/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Travelling
import UIKit

class PlaceCommentsWorkerDelegateSpy: PlaceCommentsWorkerDelegate {
    var successDidFetchItemsCalled: Bool = false
    var failureDidFetchItemsCalled: Bool = false
    
    var successDidFetchImageCalled: Bool = false
    var failureDidFetchImageCalled: Bool = false
    
    func successDidFetchItems(items: [Comment]) {
        self.successDidFetchItemsCalled = true
    }
    
    func failureDidFetchItems(error: OperationError) {
        self.failureDidFetchItemsCalled = true
    }
    
    func successDidFetchImage(item: PlaceCommentsModels.DisplayedItem, image: UIImage?) {
        self.successDidFetchImageCalled = true
    }
    
    func failureDidFetchImage(item: PlaceCommentsModels.DisplayedItem, error: OperationError) {
        self.failureDidFetchImageCalled = true
    }
}
