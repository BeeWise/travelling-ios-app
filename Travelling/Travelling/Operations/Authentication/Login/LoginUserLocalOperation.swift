//
//  LoginUserLocalOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation

class LoginUserLocalOperation: DataTaskOperation<LoginUserOperationModels.Response> {
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
                if let model = self.model as? LoginUserOperationModels.Request {
                    self.successfulResultBlock(value: LoginUserOperationModels.Response(user: self.user(account: model.account)))
                } else {
                    self.noDataAvailableErrorBlock()
                }
            }
        }
    }
    
    private func user(account: String) -> User {
        let user = User(id: "userId")
        user.firstName = "First name"
        user.lastName = "Last name"
        user.username = account
        user.description = "Description"
        return user
    }
}
