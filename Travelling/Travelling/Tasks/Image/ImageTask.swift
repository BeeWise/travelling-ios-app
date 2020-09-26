//
//  ImageTask.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation
import UIKit

open class ImageTask: ImageTaskProtocol {
    var fetchImageOperationQueue = OperationQueue()
    
    var environment: TaskEnvironment
    
    init(environment: TaskEnvironment) {
        self.environment = environment
    }
    
    open func fetchImage(model: ImageTaskModels.Fetch.Request, completionHandler: @escaping (Result<ImageTaskModels.Fetch.Response, OperationError>) -> Void) {
        let operation = self.fetchImageOperation(model: model, completionHandler: completionHandler)
        self.fetchImageOperationQueue.addOperation(operation)
    }
    
    private func fetchImageOperation(model: ImageTaskModels.Fetch.Request, completionHandler: @escaping (Result<ImageTaskModels.Fetch.Response, OperationError>) -> Void) -> AsynchronousOperation {
        let operationModel = GetImageOperationModels.Request(imageName: model.imageName)
        let operationCompletionHandler: (Result<GetImageOperationModels.Response, OperationError>) -> Void = { result in
            switch result {
                case .success(let response): completionHandler(.success(ImageTaskModels.Fetch.Response(image: response.image))); break
                case .failure(let error): completionHandler(.failure(error)); break
            }
        }
        
        switch self.environment {
            case .production: return GetImageOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .development: return GetImageOperation(model: operationModel, completionHandler: operationCompletionHandler)
            case .memory: return GetImageLocalOperation(model: operationModel, completionHandler: operationCompletionHandler)
        }
    }
    
    open func cancelFetchImageOperation() {
        self.fetchImageOperationQueue.cancelAllOperations()
    }
}
