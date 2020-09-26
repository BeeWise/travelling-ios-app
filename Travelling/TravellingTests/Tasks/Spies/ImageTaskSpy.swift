//
//  ImageTaskSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

@testable import Travelling
import Foundation
import UIKit

class ImageTaskSpy: ImageTask {
    var image: UIImage?
    var fetchImageCalled: Bool = false
    var shouldFailFetchImage: Bool = false
    
    var cancelFetchImageOperationCalled: Bool = false
    
    convenience init() {
        self.init(environment: .memory)
    }
    
    override func fetchImage(model: ImageTaskModels.Fetch.Request, completionHandler: @escaping (Result<ImageTaskModels.Fetch.Response, OperationError>) -> Void) {
        self.fetchImageCalled = true
        
        if self.shouldFailFetchImage {
            completionHandler(.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(.success(ImageTaskModels.Fetch.Response(image: self.image)))
        }
    }
    
    override func cancelFetchImageOperation() {
        self.cancelFetchImageOperationCalled = true
    }
}
