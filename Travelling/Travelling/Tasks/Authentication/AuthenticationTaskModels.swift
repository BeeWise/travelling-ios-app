//
//  AuthenticationTaskModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation

public enum AuthenticationTaskModels {
    public enum LogoutUser {
        public struct Request {
            let userId: String?
        }
        
        public struct Response {
            let userId: String?
        }
    }
}
