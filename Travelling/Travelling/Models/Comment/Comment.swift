//
//  Comment.swift
//  Travelling
//
//  Created by Dimitri Strauneanu on 12/10/2020.
//

import Foundation

public class Comment: Codable, Equatable {
    public static func == (lhs: Comment, rhs: Comment) -> Bool {
        return lhs.id == rhs.id &&
            lhs.createdAt == rhs.createdAt &&
            lhs.user == rhs.user &&
            lhs.text == rhs.text
    }
    
    var id: String
    
    var createdAt: String?
    var user: User?
    var text: String?
    
    init(id: String) {
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case user
        case text
    }
}
