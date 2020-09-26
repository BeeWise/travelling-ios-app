//
//  OperationQueueSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

class OperationQueueSpy: OperationQueue {
    var addOperationCalled: Bool = false
    var addedOperation: Operation!
    
    var cancelAllOperationsCalled: Bool = false
    
    override func addOperation(_ op: Operation) {
        self.addOperationCalled = true
        self.addedOperation = op
    }
    
    override func cancelAllOperations() {
        self.cancelAllOperationsCalled = true
    }
}
