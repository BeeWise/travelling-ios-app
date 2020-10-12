//
//  ForgotPasswordOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation

class ForgotPasswordOperation: DataTaskOperation<ForgotPasswordOperationModels.Response> {
    override func main() {
        DispatchQueue.global().async {
            if let _ = self.model as? ForgotPasswordOperationModels.Request {
                self.successfulResultBlock(value: ForgotPasswordOperationModels.Response(message: "Email sent successfully."))
            } else {
                self.noDataAvailableErrorBlock()
            }
        }
    }
}
