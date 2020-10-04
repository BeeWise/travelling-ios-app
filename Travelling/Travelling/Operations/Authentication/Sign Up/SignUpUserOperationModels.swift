//
//  SignUpUserOperationModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation

enum SignUpUserOperationModels {
    struct Request {
        let email: String?
        let username: String?
        let password: String?
        let firstName: String?
        let lastName: String?
        let description: String?
        let photoBase64: String?
    }
    
    struct Response {
        let user: User
    }
}
