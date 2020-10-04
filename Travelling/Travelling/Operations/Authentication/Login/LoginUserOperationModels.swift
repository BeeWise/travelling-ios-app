//
//  LoginUserOperationModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation

enum LoginUserOperationModels {
    struct Request {
        let account: String
        let password: String
    }
    
    struct Response {
        let user: User
    }
}
