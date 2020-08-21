//
//  ResponseApiQuestion.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 20/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import Foundation

struct ResponseApiQuestion: Decodable {
    var items: [Question]?
    
}

struct Question: Decodable {
    let user: User?
    let postCount: Int?
    let score: Int?
    
}

struct User: Decodable {
    let reputation: Int?
    let userId: Int?
    let userType: String?
    let acceptRate: Int?
    let profileImage: String?
    let displayName: String?
    let link: String?
}
