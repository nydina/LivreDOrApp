//
//  Message.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let myMessages = try? newJSONDecoder().decode(MyMessages.self, from: jsonData)

import Foundation

// MARK: - MyMessages
struct MyMessages: Codable {
    let messages: [Message]
}

// MARK: - Message
struct Message: Codable {
    let row: Row
}

// MARK: - Row
struct Row: Codable, Identifiable {
    let id: Int
    var content: String
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, content
        case createdAt = "created_at"
    }
}
