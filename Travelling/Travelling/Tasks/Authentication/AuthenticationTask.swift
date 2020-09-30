//
//  AuthenticationTask.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation

open class AuthenticationTask: AuthenticationTaskProtocol {
    var logoutUserOperationQueue = OperationQueue()
    
    var environment: TaskEnvironment
    
    init(environment: TaskEnvironment) {
        self.environment = environment
    }
    
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
}
