//
//  GetPlaceOperationModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 08/10/2020.
//

import Foundation

enum GetPlaceOperationModels {
    struct Request {
        let placeId: String?
    }
    
    struct Response {
        let place: Place
    }
}
