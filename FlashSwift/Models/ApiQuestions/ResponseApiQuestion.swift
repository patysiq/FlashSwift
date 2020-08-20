//
//  ResponseApiQuestion.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 20/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import Foundation

struct ResponseApiQuestion: Decodable {
    let items: [Question]?
    
    init(items: [Question]?) {
        self.items = items
    }
    
    enum CodingKeys:String, CodingKey {
        case items
    }
    
     init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.items = try container.decode([Question].self, forKey: .items)
      }
}
