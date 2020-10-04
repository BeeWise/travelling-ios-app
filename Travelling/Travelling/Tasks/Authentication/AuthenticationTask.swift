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
    
    // MARK: - Sign up user
    
    var signUpUserOperationQueue = OperationQueue()
    
    open func signUpUser(model: AuthenticationTaskModels.SignUpUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.SignUpUser.Response, OperationError>) -> Void) {
        let operation = self.signUpUserOperation(model: model, completionHandler: completionHandler)
        self.signUpUserOperationQueue.addOperation(operation)
    }
    
    private func signUpUserOperation(model: AuthenticationTaskModels.SignUpUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.SignUpUser.Response, OperationError>) -> Void) -> DataTaskOperation<SignUpUserOperationModels.Response> {
        let operationModel = SignUpUserOperationModels.Request(email: model.email, username: model.username, password: model.password, firstName: model.firstName, lastName: model.lastName, description: model.description, photoBase64: model.photoBase64)
        let operationCompletionHandler: ((Result<SignUpUserOperationModels.Response, OperationError>) -> Void) = { result in
            switch result {
                case .success(let response): completionHandler(.success(AuthenticationTaskModels.SignUpUser.Response(user: response.user))); break
                case .failure(let error): completionHandler(.failure(error)); break
            }
        }
        
        switch self.environment {
            case .production: return SignUpUserOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .development: return SignUpUserOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .memory: return SignUpUserLocalOperation(model: operationModel, completionHandler: operationCompletionHandler)
        }
    }
    
    open func cancelSignUpUserOperation() {
        self.signUpUserOperationQueue.cancelAllOperations()
    }
    
    // MARK: - Forgot password
    
    var forgotPasswordOperationQueue = OperationQueue()
    
    open func forgotPassword(model: AuthenticationTaskModels.ForgotPassword.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.ForgotPassword.Response, OperationError>) -> Void) {
        let operation = self.forgotPasswordOperation(model: model, completionHandler: completionHandler)
        self.forgotPasswordOperationQueue.addOperation(operation)
    }
    
    private func forgotPasswordOperation(model: AuthenticationTaskModels.ForgotPassword.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.ForgotPassword.Response, OperationError>) -> Void) -> DataTaskOperation<ForgotPasswordOperationModels.Response> {
        let operationModel = ForgotPasswordOperationModels.Request(email: model.email)
        let operationCompletionHandler: ((Result<ForgotPasswordOperationModels.Response, OperationError>) -> Void) = { result in
            switch result {
                case .success(let response): completionHandler(.success(AuthenticationTaskModels.ForgotPassword.Response(message: response.message))); break
                case .failure(let error): completionHandler(.failure(error)); break
            }
        }
        
        switch self.environment {
            case .production: return ForgotPasswordOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .development: return ForgotPasswordOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .memory: return ForgotPasswordLocalOperation(model: operationModel, completionHandler: operationCompletionHandler)
        }
    }
    
    open func cancelForgotPasswordOperation() {
        self.forgotPasswordOperationQueue.cancelAllOperations()
    }
}
