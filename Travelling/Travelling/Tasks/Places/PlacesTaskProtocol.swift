//
//  PlacesTaskProtocol.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol PlacesTaskProtocol: TaskProtocol {
    func fetchPlaces(model: PlacesTaskModels.Fetch.Request, completionHandler: @escaping (Result<PlacesTaskModels.Fetch.Response, OperationError>) -> Void)
    func cancelFetchPlacesOperation()
}
