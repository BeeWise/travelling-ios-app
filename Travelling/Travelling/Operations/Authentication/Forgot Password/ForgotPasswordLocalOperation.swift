//
//  ForgotPasswordLocalOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation

class ForgotPasswordLocalOperation: DataTaskOperation<ForgotPasswordOperationModels.Response> {
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
                if let _ = self.model as? ForgotPasswordOperationModels.Request {
                    self.successfulResultBlock(value: ForgotPasswordOperationModels.Response(message: "Email sent successfully."))
                } else {
                    self.noDataAvailableErrorBlock()
                }
            }
        }
    }
}
