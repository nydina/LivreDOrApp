//
//  Message.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 24/10/2022.
//

import Foundation

/// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let myData = try? newJSONDecoder().decode(MyData.self, from: jsonData)

import Foundation

// MARK: - MyData
struct MyData: Codable {
    var messages: [Message]
}

// MARK: - Message
struct Message: Identifiable, Codable {
    let id: Int
    var content: String
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, content
        case createdAt = "created_at"
    }
}
