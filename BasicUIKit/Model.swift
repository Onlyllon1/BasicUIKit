//
//  Model.swift
//  BasicUIKit
//
//  Created by Francesco on 22/04/24.
//

import Foundation

struct UserResponse: Codable{
    let data: [PersoneResponse]
}

struct PersoneResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}
