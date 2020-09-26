//
//  PlacesTask.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

open class PlacesTask: PlacesTaskProtocol {
    var fetchPlacesOperationQueue = OperationQueue()
    
    var environment: TaskEnvironment
    
    init(environment: TaskEnvironment) {
        self.environment = environment
    }
    
    open func fetchPlaces(model: PlacesTaskModels.Fetch.Request, completionHandler: @escaping (Result<PlacesTaskModels.Fetch.Response, OperationError>) -> Void) {
        let operation = self.fetchPlacesOperation(model: model, completionHandler: completionHandler)
        self.fetchPlacesOperationQueue.addOperation(operation)
    }
    
    private func fetchPlacesOperation(model: PlacesTaskModels.Fetch.Request, completionHandler: @escaping (Result<PlacesTaskModels.Fetch.Response, OperationError>) -> Void) -> DataTaskOperation<GetPlacesOperationModels.Response> {
        let operationModel = GetPlacesOperationModels.Request(page: model.page, limit: model.limit)
        let operationCompletionHandler: ((Result<GetPlacesOperationModels.Response, OperationError>) -> Void) = { result in
            switch result {
                case .success(let response): completionHandler(.success(PlacesTaskModels.Fetch.Response(places: response.places, page: response.page, limit: response.limit))); break
                case .failure(let error): completionHandler(.failure(error)); break
            }
        }
        
        switch self.environment {
            case .production: return GetPlacesOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .development: return GetPlacesOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .memory: return GetPlacesLocalOperation(model: operationModel, completionHandler: operationCompletionHandler)
        }
    }
    
    open func cancelFetchPlacesOperation() {
        self.fetchPlacesOperationQueue.cancelAllOperations()
    }
}
