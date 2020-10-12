//
//  LogoutUserOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation

class LogoutUserOperation: DataTaskOperation<LogoutUserOperationModels.Response> {
    override func main() {
        DispatchQueue.global().async {
            if let model = self.model as? LogoutUserOperationModels.Request {
                self.successfulResultBlock(value: LogoutUserOperationModels.Response(userId: model.userId))
            } else {
                self.noDataAvailableErrorBlock()
            }
        }
    }
}
