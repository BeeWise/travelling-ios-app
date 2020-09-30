//
//  GetUserLocalOperation.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation

class GetUserLocalOperation: DataTaskOperation<GetUserOperationModels.Response> {
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
                if let model = self.model as? GetUserOperationModels.Request, let userId = model.userId {
                    self.successfulResultBlock(value: GetUserOperationModels.Response(user: self.user(id: userId)))
                } else {
                    self.noDataAvailableErrorBlock()
                }
            }
        }
    }
    
    private func user(id: String) -> User {
        let user = User(id: id)
        user.firstName = "First name"
        user.lastName = "Last name"
        user.title = "Title"
        user.description = "Description"
        return user
    }
}
