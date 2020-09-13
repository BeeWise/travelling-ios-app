//
//  PlacesTaskSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

@testable import Travelling
import Foundation

class PlacesTaskSpy: PlacesTask {
    var places: [Place] = []
    var fetchPlacesCalled: Bool = false
    var shouldFailFetchPlaces: Bool = false
    
    var cancelFetchPlacesOperationCalled: Bool = false
    
    convenience init() {
        self.init(environment: .memory)
    }
    
    override func fetchPlaces(model: PlacesTaskModels.Fetch.Request, completionHandler: @escaping (Result<PlacesTaskModels.Fetch.Response, OperationError>) -> Void) {
        self.fetchPlacesCalled = true
        
        if self.shouldFailFetchPlaces {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(PlacesTaskModels.Fetch.Response(places: self.places, page: 0, limit: 0)))
        }
    }
    
    override func cancelFetchPlacesOperation() {
        self.cancelFetchPlacesOperationCalled = true
    }
}
