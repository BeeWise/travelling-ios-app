//
//  GetPlacesOperationModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

enum GetPlacesOperationModels {
    struct Request {
        let page: Int
        let limit: Int
    }
    
    struct Response {
        let places: [Place]
        let page: Int
        let limit: Int
    }
}
