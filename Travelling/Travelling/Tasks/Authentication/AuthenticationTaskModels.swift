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
    
    public enum LoginUser {
        public struct Request {
            let account: String
            let password: String
        }
        
        public struct Response {
            let user: User
        }
    }
    
    public enum SignUpUser {
        public struct Request {
            let email: String?
            let username: String?
            let password: String?
            let firstName: String?
            let lastName: String?
            let description: String?
            let photoBase64: String?
        }
        
        public struct Response {
            let user: User
        }
    }
    
    public enum ForgotPassword {
        public struct Request {
            let email: String
        }
        
        public struct Response {
            let message: String?
        }
    }
}
