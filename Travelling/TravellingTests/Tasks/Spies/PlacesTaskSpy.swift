//
//  PlacesTaskSpy.swift
//  TravellingTests
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

@testable import Travelling
import Foundation

class PlacesTaskSpy: PlacesTask {
    convenience init() {
        self.init(environment: .memory)
    }
    
    // MARK: - Fetch places
    
    var places: [Place] = []
    var fetchPlacesCalled: Bool = false
    var shouldFailFetchPlaces: Bool = false
    
    var cancelFetchPlacesOperationCalled: Bool = false
    
    override func fetchPlaces(model: PlacesTaskModels.FetchPlaces.Request, completionHandler: @escaping (Result<PlacesTaskModels.FetchPlaces.Response, OperationError>) -> Void) {
        self.fetchPlacesCalled = true
        
        if self.shouldFailFetchPlaces {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(PlacesTaskModels.FetchPlaces.Response(places: self.places, page: 0, limit: 0)))
        }
    }
    
    override func cancelFetchPlacesOperation() {
        self.cancelFetchPlacesOperationCalled = true
    }
    
    // MARK: - Fetch place
    
    var place: Place = Place(id: "placeId", location: Location(id: "locationId", latitude: 20, longitude: 20))
    var fetchPlaceCalled: Bool = false
    var shouldFailFetchPlace: Bool = false
    
    var cancelFetchPlaceOperationCalled: Bool = false
    
    override func fetchPlace(model: PlacesTaskModels.FetchPlace.Request, completionHandler: @escaping (Result<PlacesTaskModels.FetchPlace.Response, OperationError>) -> Void) {
        self.fetchPlaceCalled = true
        
        if self.shouldFailFetchPlace {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(PlacesTaskModels.FetchPlace.Response(place: self.place)))
        }
    }
    
    override func cancelFetchPlaceOperation() {
        self.cancelFetchPlaceOperationCalled = true
    }
}
