//
//  AuthenticationTaskSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

@testable import Travelling
import Foundation

class AuthenticationTaskSpy: AuthenticationTask {
    var userId = "userId"
    var logoutUserCalled: Bool = false
    var shouldFailLogoutUser: Bool = false
    
    var cancelLogoutUserOperationCalled: Bool = false
    
    convenience init() {
        self.init(environment: .memory)
    }
    
    override func logoutUser(model: AuthenticationTaskModels.LogoutUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.LogoutUser.Response, OperationError>) -> Void) {
        self.logoutUserCalled = true
        
        if self.shouldFailLogoutUser {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(AuthenticationTaskModels.LogoutUser.Response(userId: self.userId)))
        }
    }
    
    override func cancelLogoutUserOperation() {
        self.cancelLogoutUserOperationCalled = true
    }
}
