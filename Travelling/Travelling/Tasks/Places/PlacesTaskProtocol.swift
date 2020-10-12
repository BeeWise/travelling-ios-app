//
//  PlacesTaskProtocol.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//  Copyright (c) 2020 Travelling. All rights reserved.
//

import Foundation

protocol PlacesTaskProtocol: TaskProtocol {
    func fetchPlaces(model: PlacesTaskModels.FetchPlaces.Request, completionHandler: @escaping (Result<PlacesTaskModels.FetchPlaces.Response, OperationError>) -> Void)
    func cancelFetchPlacesOperation()
    
    func fetchPlace(model: PlacesTaskModels.FetchPlace.Request, completionHandler: @escaping (Result<PlacesTaskModels.FetchPlace.Response, OperationError>) -> Void)
    func cancelFetchPlaceOperation()
}
