//
//  LogoutUserOperationModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation

enum LogoutUserOperationModels {
    struct Request {
        let userId: String?
    }
    
    struct Response {
        let userId: String?
    }
}
