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
    
    var loginUser = User(id: "userId")
    var loginUserCalled: Bool = false
    var shouldFailLoginUser: Bool = false
    
    var cancelLoginUserOperationCalled: Bool = false
    
    override func loginUser(model: AuthenticationTaskModels.LoginUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.LoginUser.Response, OperationError>) -> Void) {
        self.loginUserCalled = true
        
        if self.shouldFailLoginUser {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(AuthenticationTaskModels.LoginUser.Response(user: self.loginUser)))
        }
    }
    
    override func cancelLoginUserOperation() {
        self.cancelLoginUserOperationCalled = true
    }
    
    // MARK: - Sign up user
    
    var signUpUser = User(id: "userId")
    var signUpUserCalled: Bool = false
    var shouldFailSignUpUser: Bool = false
    
    var cancelSignUpUserOperationCalled: Bool = false
    
    override func signUpUser(model: AuthenticationTaskModels.SignUpUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.SignUpUser.Response, OperationError>) -> Void) {
        self.signUpUserCalled = true
        
        if self.shouldFailSignUpUser {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(AuthenticationTaskModels.SignUpUser.Response(user: self.signUpUser)))
        }
    }
    
    override func cancelSignUpUserOperation() {
        self.cancelSignUpUserOperationCalled = true
    }
}
