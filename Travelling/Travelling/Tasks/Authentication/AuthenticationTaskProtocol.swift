//
//  AuthenticationTaskProtocol.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 30/09/2020.
//

import Foundation

protocol AuthenticationTaskProtocol: TaskProtocol {
    func logoutUser(model: AuthenticationTaskModels.LogoutUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.LogoutUser.Response, OperationError>) -> Void)
    func cancelLogoutUserOperation()
    
    func loginUser(model: AuthenticationTaskModels.LoginUser.Request, completionHandler: @escaping (Result<AuthenticationTaskModels.LoginUser.Response, OperationError>) -> Void)
    func cancelLoginUserOperation()
}
