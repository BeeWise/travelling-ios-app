//
//  User.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 27/09/2020.
//

import Foundation

public class User: Codable {
    var id: String
    
    var firstName: String?
    var lastName: String?
    
    var title: String?
    var description: String?
    
    var photo: Photo?
    
    init(id: String) {
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case title
        case description
        case photo
    }
}
