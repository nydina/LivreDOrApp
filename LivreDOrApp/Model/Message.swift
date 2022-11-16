//
//  Message.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//
import Foundation

// MARK: - Message
struct Message: Identifiable, Codable {
    var id: Int
    var content: String
    var createdAt, updatedAt: String?
    var userId: Int?
    var user: User?
    
    
    enum CodingKeys: String, CodingKey {
        case id, content, createdAt, updatedAt
        case userId
        case user
    }
}

