//
//  ImageTaskProtocol.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 20/09/2020.
//

import Foundation

protocol ImageTaskProtocol: TaskProtocol {
    func fetchImage(model: ImageTaskModels.Fetch.Request, completionHandler: @escaping (Result<ImageTaskModels.Fetch.Response, OperationError>) -> Void)
    func cancelFetchImageOperation()
}
