//
//  UsersTaskProtocol.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 29/09/2020.
//

import Foundation

protocol UsersTaskProtocol: TaskProtocol {
    func fetchUser(model: UsersTaskModels.FetchUser.Request, completionHandler: @escaping (Result<UsersTaskModels.FetchUser.Response, OperationError>) -> Void)
    func cancelFetchUserOperation()
}
