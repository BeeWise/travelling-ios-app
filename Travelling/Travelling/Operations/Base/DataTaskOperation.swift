//
//  DataTaskOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

class DataTaskOperation<T>: AsynchronousOperation {
    var model: Any?
    var completionHandler: ((Result<T, OperationError>) -> Void)
    
    init(model: Any? = nil, completionHandler: @escaping ((Result<T, OperationError>) -> Void)) {
        self.model = model
        self.completionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        if self.shouldCancelOperation() {
            return
        }
    }
    
    override func cancel() {
        super.cancel()
    }
    
    func shouldCancelOperation() -> Bool {
        if self.isCancelled {
            self.cancelledOperationErrorBlock()
            return true
        }
        return false
    }
    
    // MARK: - Successful result
    
    func successfulResultBlock(value: T) {
        self.completionHandler(Result.success(value))
        self.completeOperation()
    }
    
    // MARK: - Operation errors
    
    func noDataAvailableErrorBlock() {
        self.completionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
    
    func cannotParseResponseErrorBlock() {
        self.completionHandler(Result.failure(OperationError.cannotParseResponse))
        self.completeOperation()
    }
    
    func cancelledOperationErrorBlock() {
        self.completionHandler(Result.failure(OperationError.operationCancelled))
        self.completeOperation()
    }
    
    // MARK: - Server errors
    
    func responseErrorBlock(errorDescription: String, code: Int?) {
        self.completionHandler(Result.failure(OperationError.error(message: errorDescription, code: code)))
        self.completeOperation()
    }
}
