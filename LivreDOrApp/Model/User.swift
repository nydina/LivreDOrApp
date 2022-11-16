//
//  User.swift
//  LivreDOrApp
//
//  Created by Dina Andrianarijaona on 16/11/2022.
//

import Foundation

struct User: Codable {
    var id: Int
    var username, email, password, createdAt: String
    var updatedAt: String
}
