//
//  AuthenticationTask.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation

open class AuthenticationTask: AuthenticationTaskProtocol {
    var environment: TaskEnvironment
    
    init(environment: TaskEnvironment) {
        self.environment = environment
    }
    
    // MARK: - Logout user
    
    var logoutUserOperationQueue = OperationQueue()
    
    open func logoutUser(model: AuthenticationTaskModels.LogoutUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.LogoutUser.Response, OperationError>) -> Void) {
        let operation = self.logoutUserOperation(model: model, completionHandler: completionHandler)
        self.logoutUserOperationQueue.addOperation(operation)
    }
    
    private func logoutUserOperation(model: AuthenticationTaskModels.LogoutUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.LogoutUser.Response, OperationError>) -> Void) -> DataTaskOperation<LogoutUserOperationModels.Response> {
        let operationModel = LogoutUserOperationModels.Request(userId: model.userId)
        let operationCompletionHandler: ((Result<LogoutUserOperationModels.Response, OperationError>) -> Void) = { result in
            switch result {
                case .success(let response): completionHandler(.success(AuthenticationTaskModels.LogoutUser.Response(userId: response.userId))); break
                case .failure(let error): completionHandler(.failure(error)); break
            }
        }
        
        switch self.environment {
            case .production: return LogoutUserOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .development: return LogoutUserOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .memory: return LogoutUserLocalOperation(model: operationModel, completionHandler: operationCompletionHandler)
        }
    }
    
    open func cancelLogoutUserOperation() {
        self.logoutUserOperationQueue.cancelAllOperations()
    }
    
    // MARK: - Login user
    
    var loginUserOperationQueue = OperationQueue()
    
    open func loginUser(model: AuthenticationTaskModels.LoginUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.LoginUser.Response, OperationError>) -> Void) {
        let operation = self.loginUserOperation(model: model, completionHandler: completionHandler)
        self.loginUserOperationQueue.addOperation(operation)
    }
    
    private func loginUserOperation(model: AuthenticationTaskModels.LoginUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.LoginUser.Response, OperationError>) -> Void) -> DataTaskOperation<LoginUserOperationModels.Response> {
        let operationModel = LoginUserOperationModels.Request(account: model.account, password: model.password)
        let operationCompletionHandler: ((Result<LoginUserOperationModels.Response, OperationError>) -> Void) = { result in
            switch result {
                case .success(let response): completionHandler(.success(AuthenticationTaskModels.LoginUser.Response(user: response.user))); break
                case .failure(let error): completionHandler(.failure(error)); break
            }
        }
        
        switch self.environment {
            case .production: return LoginUserOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .development: return LoginUserOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .memory: return LoginUserLocalOperation(model: operationModel, completionHandler: operationCompletionHandler)
        }
    }
    
    open func cancelLoginUserOperation() {
        self.loginUserOperationQueue.cancelAllOperations()
    }
}
