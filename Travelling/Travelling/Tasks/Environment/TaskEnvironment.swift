//
//  TaskEnvironment.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

enum TaskEnvironment: String {
    case production = "production"
    case development = "development"
    case memory = "memory"
    
    static func from(value: String) -> TaskEnvironment {
        return TaskEnvironment(rawValue: value) ?? .memory
    }
}
