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
    
    func imageTask() -> ImageTaskProtocol {
        return ImageTask(environment: self.environment)
    }
    
    func usersTask() -> UsersTaskProtocol {
        return UsersTask(environment: self.environment)
    }
    
    func authenticationTask() -> AuthenticationTaskProtocol {
        return AuthenticationTask(environment: self.environment)
    }
}
