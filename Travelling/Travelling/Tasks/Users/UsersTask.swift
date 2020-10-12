//
//  UsersTask.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation

open class UsersTask: UsersTaskProtocol {
    var fetchUserOperationQueue = OperationQueue()
    
    var environment: TaskEnvironment
    
    init(environment: TaskEnvironment) {
        self.environment = environment
    }
    
    open func fetchUser(model: UsersTaskModels.FetchUser.Request, completionHandler: @escaping (Result<UsersTaskModels.FetchUser.Response, OperationError>) -> Void) {
        let operation = self.fetchUserOperation(model: model, completionHandler: completionHandler)
        self.fetchUserOperationQueue.addOperation(operation)
    }
    
    private func fetchUserOperation(model: UsersTaskModels.FetchUser.Request, completionHandler: @escaping (Result<UsersTaskModels.FetchUser.Response, OperationError>) -> Void) -> DataTaskOperation<GetUserOperationModels.Response> {
        let operationModel = GetUserOperationModels.Request(userId: model.userId)
        let operationCompletionHandler: ((Result<GetUserOperationModels.Response, OperationError>) -> Void) = { result in
            switch result {
                case .success(let response): completionHandler(.success(UsersTaskModels.FetchUser.Response(user: response.user))); break
                case .failure(let error): completionHandler(.failure(error)); break
            }
        }
        
        switch self.environment {
            case .production: return GetUserOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .development: return GetUserOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .memory: return GetUserLocalOperation(model: operationModel, completionHandler: operationCompletionHandler)
        }
    }
    
    open func cancelFetchUserOperation() {
        self.fetchUserOperationQueue.cancelAllOperations()
    }
}
