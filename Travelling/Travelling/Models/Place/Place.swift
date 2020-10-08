//
//  Place.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 13/09/2020.
//

import Foundation

public class Place: Codable {
    var id: String
    
    var location: Location
    
    var createdAt: String?
    var name: String?
    var description: String?
    var commentCount: Int = 0
    
    var photo: Photo?
    
    init(id: String, location: Location) {
        self.id = id
        self.location = location
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case location
        case createdAt = "created_at"
        case name
        case description
        case commentCount = "comment_count"
        case photo
    }
}
