//
//  GetPlaceCommentsOperationModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/10/2020.
//

import Foundation

enum GetPlaceCommentsOperationModels {
    struct Request {
        let placeId: String?
        let page: Int
        let limit: Int
    }
    
    struct Response {
        let comments: [Comment]
        let page: Int
        let limit: Int
    }
}
