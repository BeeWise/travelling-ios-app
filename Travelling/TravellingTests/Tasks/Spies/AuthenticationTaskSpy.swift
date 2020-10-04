//
//  AuthenticationTaskSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

@testable import Travelling
import Foundation

class AuthenticationTaskSpy: AuthenticationTask {
    convenience init() {
        self.init(environment: .memory)
    }
    
    // MARK: - Logout user
    
    var userId = "userId"
    var logoutUserCalled: Bool = false
    var shouldFailLogoutUser: Bool = false
    
    var cancelLogoutUserOperationCalled: Bool = false
    
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
    
    // MARK: - Login user
    
    var user = User(id: "userId")
    var loginUserCalled: Bool = false
    var shouldFailLoginUser: Bool = false
    
    var cancelLoginUserOperationCalled: Bool = false
    
    override func loginUser(model: AuthenticationTaskModels.LoginUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.LoginUser.Response, OperationError>) -> Void) {
        self.loginUserCalled = true
        
        if self.shouldFailLoginUser {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(AuthenticationTaskModels.LoginUser.Response(user: self.user)))
        }
    }
    
    override func cancelLoginUserOperation() {
        self.cancelLoginUserOperationCalled = true
    }
}
