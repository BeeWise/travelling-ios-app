//
//  OperationError.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

public enum OperationError: LocalizedError {
    case noUrlAvailable
    case noDataAvailable
    case cannotParseResponse
    case noInternetConnection
    case operationCancelled
    
    case error(message: String, code: Int?)
    
    public var errorDescription: String {
        switch self {
            case .noUrlAvailable: return "No url available."
            case .noDataAvailable: return "No data available."
            case .cannotParseResponse: return "Cannot parse response."
            case .noInternetConnection: return "No internet connection."
            case .operationCancelled: return ""
            case .error(let message, _): return message
        }
    }
}

extension OperationError: Equatable {
    
}
