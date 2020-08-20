//
//  QuestionModel.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 20/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import Foundation

struct Question: Decodable {
    var postCount: Int = 0
    var score: Int = 0
    
    var reputation: Int = 0
    var userId: Int = 0
    var userType: String = ""
    var acceptRate: Int = 0
    var profileImage: String = ""
    var displayName: String = ""
    var link: String = ""
    
    enum CodingKeys:String, CodingKey {
        case postCount = "post_count"
        case score
        case reputation
        case userId = "user_id"
        case userType = "user_type"
        case acceptRate = "accept_rate"
        case profileImage = "profile_image"
        case displayName = "display_name"
        case link
        case user
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let user = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .user)
        
        //Parse post_count
        self.postCount = try container.decode(Int.self, forKey: .postCount)
        //Parse score
        self.score = try container.decode(Int.self, forKey: .score)
        
        //Parse reputation
        self.reputation = try user.decode(Int.self, forKey: .reputation)
        //Parse user_id
        self.userId = try user.decode(Int.self, forKey: .userId)
        //Parse user_type
        self.userType = try user.decode(String.self, forKey: .userType)
        //Parse accept_rate
        self.acceptRate = try user.decode(Int.self, forKey: .acceptRate)
        //Parse profile_image
        self.profileImage = try user.decode(String.self, forKey: .profileImage)
        //Parse display_name
        self.displayName = try user.decode(String.self, forKey: .displayName)
        //Parse link
        self.link = try user.decode(String.self, forKey: .link)
    }
    
}
