//
//  DetailModel.swift
//  chicfy
//
//  Created by Daniel Martin Jimenez on 21/10/18.
//  Copyright © 2018 Daniel Martin Jimenez. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let commentId: Int
    let name: String
    let email: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case postId
        case commentId = "id"
        case name
        case email
        case body
    }
}
