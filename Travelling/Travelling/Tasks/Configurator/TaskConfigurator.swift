//
//  TaskConfigurator.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

class TaskConfigurator {
    static let shared = TaskConfigurator()
    
    var environment: TaskEnvironment = .memory
    
    init() {
        
    }
    
    func placesTask() -> PlacesTaskProtocol {
        return PlacesTask(environment: self.environment)
    }
}
