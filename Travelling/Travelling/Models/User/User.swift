//
//  User.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 27/09/2020.
//

import Foundation

public class User: Codable, Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id &&
            lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.email == rhs.email &&
            lhs.username == rhs.username &&
            lhs.description == rhs.description &&
            lhs.photo == rhs.photo
    }
    
    var id: String
    
    var firstName: String?
    var lastName: String?
    
    var email: String?
    var username: String?
    var description: String?
    
    var photo: Photo?
    
    init(id: String) {
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case username
        case description
        case photo
    }
}
