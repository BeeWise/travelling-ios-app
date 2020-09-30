//
//  UsersTaskSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

@testable import Travelling
import Foundation

class UsersTaskSpy: UsersTask {
    var user: User = User(id: "userId")
    var fetchUserCalled: Bool = false
    var shouldFailFetchUser: Bool = false
    
    var cancelFetchUserOperationCalled: Bool = false
    
    convenience init() {
        self.init(environment: .memory)
    }
    
    override func fetchUser(model: UsersTaskModels.FetchUser.Request, completionHandler: @escaping (Result<UsersTaskModels.FetchUser.Response, OperationError>) -> Void) {
        self.fetchUserCalled = true
        
        if self.shouldFailFetchUser {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(UsersTaskModels.FetchUser.Response(user: self.user)))
        }
    }
    
    override func cancelFetchUserOperation() {
        self.cancelFetchUserOperationCalled = true
    }
}
