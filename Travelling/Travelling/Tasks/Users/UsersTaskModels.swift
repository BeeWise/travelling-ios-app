//
//  UsersTaskModels.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation

public enum UsersTaskModels {
    public enum FetchUser {
        public struct Request {
            let userId: String?
        }
        
        public struct Response {
            let user: User
        }
    }
}
