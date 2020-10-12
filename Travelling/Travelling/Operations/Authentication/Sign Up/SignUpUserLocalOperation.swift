//
//  SignUpUserLocalOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation

class SignUpUserLocalOperation: DataTaskOperation<SignUpUserOperationModels.Response> {
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
                if let model = self.model as? SignUpUserOperationModels.Request {
                    self.successfulResultBlock(value: SignUpUserOperationModels.Response(user: self.user(email: model.email, username: model.username)))
                } else {
                    self.noDataAvailableErrorBlock()
                }
            }
        }
    }
    
    private func user(email: String?, username: String?) -> User {
        let user = User(id: "userId")
        user.firstName = "First name"
        user.lastName = "Last name"
        user.email = email
        user.username = username
        user.description = "Description"
        return user
    }
}
