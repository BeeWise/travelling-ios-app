//
//  ForgotPasswordOperationModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 04/10/2020.
//

import Foundation

enum ForgotPasswordOperationModels {
    struct Request {
        let email: String
    }
    
    struct Response {
        let message: String?
    }
}
