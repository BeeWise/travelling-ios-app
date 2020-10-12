//
//  LogoutUserLocalOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation

class LogoutUserLocalOperation: DataTaskOperation<LogoutUserOperationModels.Response> {
    var shouldFail: Bool = false
    var delay: Int = Int.random(in: 1000 ... 3000)
    
    override func main() {
        if self.shouldCancelOperation() {
            return
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(self.delay)) {
            if self.shouldCancelOperation() {
                return
            }
            if self.shouldFail {
                self.noDataAvailableErrorBlock()
            } else {
                if let model = self.model as? LogoutUserOperationModels.Request {
                    self.successfulResultBlock(value: LogoutUserOperationModels.Response(userId: model.userId))
                } else {
                    self.noDataAvailableErrorBlock()
                }
            }
        }
    }
}
