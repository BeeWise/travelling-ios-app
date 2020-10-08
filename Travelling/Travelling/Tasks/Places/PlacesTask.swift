//
//  PlacesTask.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

open class PlacesTask: PlacesTaskProtocol {
    var environment: TaskEnvironment
    
    init(environment: TaskEnvironment) {
        self.environment = environment
    }
    
    // MARK: - Fetch places
    
    var fetchPlacesOperationQueue = OperationQueue()
    
    open func fetchPlaces(model: PlacesTaskModels.FetchPlaces.Request, completionHandler: @escaping (Result<PlacesTaskModels.FetchPlaces.Response, OperationError>) -> Void) {
        let operation = self.fetchPlacesOperation(model: model, completionHandler: completionHandler)
        self.fetchPlacesOperationQueue.addOperation(operation)
    }
    
    private func fetchPlacesOperation(model: PlacesTaskModels.FetchPlaces.Request, completionHandler: @escaping (Result<PlacesTaskModels.FetchPlaces.Response, OperationError>) -> Void) -> DataTaskOperation<GetPlacesOperationModels.Response> {
        let operationModel = GetPlacesOperationModels.Request(page: model.page, limit: model.limit)
        let operationCompletionHandler: ((Result<GetPlacesOperationModels.Response, OperationError>) -> Void) = { result in
            switch result {
                case .success(let response): completionHandler(.success(PlacesTaskModels.FetchPlaces.Response(places: response.places, page: response.page, limit: response.limit))); break
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
    
    // MARK: - Fetch place
    
    var fetchPlaceOperationQueue = OperationQueue()
    
    open func fetchPlace(model: PlacesTaskModels.FetchPlace.Request, completionHandler: @escaping (Result<PlacesTaskModels.FetchPlace.Response, OperationError>) -> Void) {
        let operation = self.fetchPlaceOperation(model: model, completionHandler: completionHandler)
        self.fetchPlaceOperationQueue.addOperation(operation)
    }
    
    private func fetchPlaceOperation(model: PlacesTaskModels.FetchPlace.Request, completionHandler: @escaping (Result<PlacesTaskModels.FetchPlace.Response, OperationError>) -> Void) -> DataTaskOperation<GetPlaceOperationModels.Response> {
        let operationModel = GetPlaceOperationModels.Request(placeId: model.placeId)
        let operationCompletionHandler: ((Result<GetPlaceOperationModels.Response, OperationError>) -> Void) = { result in
            switch result {
                case .success(let response): completionHandler(.success(PlacesTaskModels.FetchPlace.Response(place: response.place))); break
                case .failure(let error): completionHandler(.failure(error)); break
            }
        }
        
        switch self.environment {
            case .production: return GetPlaceOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .development: return GetPlaceOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .memory: return GetPlaceLocalOperation(model: operationModel, completionHandler: operationCompletionHandler)
        }
    }
    
    open func cancelFetchPlaceOperation() {
        self.fetchPlaceOperationQueue.cancelAllOperations()
    }
}
