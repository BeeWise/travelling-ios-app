//
//  GetUserOperationModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation

enum GetUserOperationModels {
    struct Request {
        let userId: String?
    }
    
    struct Response {
        let user: User
    }
}
