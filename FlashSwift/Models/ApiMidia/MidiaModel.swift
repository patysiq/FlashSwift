//
//  MidiaModel.swift
//  FlashSwift
//
//  Created by PATRICIA S SIQUEIRA on 14/08/20.
//  Copyright © 2020 PATRICIA S SIQUEIRA. All rights reserved.
//

import Foundation

struct Video: Codable {
    
    var videoId: String
    var title: String
    var description: String
    var thumbnail: String
    var publishedAt: Date
    var channelTitle: String
    
    enum CodingKeys : String, CodingKey {
        case snippet
        case videoContainerId = "id"
    }
    
    enum AdditionalInfoKeys : String, CodingKey {
        case channelTitle
        case thumbnails
        case publishedAt
        case title
        case description
        case videoId
    }
    
    enum InfoKeys: String, CodingKey {
        case high
    }
    
    enum Keys: String, CodingKey {
        case thumbnail = "url"
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .snippet)
        let idContainer = try container.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .videoContainerId)
        
        //Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        //Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        //Parse publish date
        self.publishedAt = try snippetContainer.decode(Date.self, forKey: .publishedAt)
        //Parse channel Title
        self.channelTitle = try snippetContainer.decode(String.self, forKey: .channelTitle)
        //Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: InfoKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: Keys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        //Parse Video Id
        self.videoId = try idContainer.decode(String.self, forKey: .videoId)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        var snippetContainer = container.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .snippet)
        var idContainer = container.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .videoContainerId)
        
        //Parse title
        try snippetContainer.encode(title, forKey: .title)
        //Parse description
        try snippetContainer.encode(description, forKey: .description)
        //Parse publish date
        try snippetContainer.encode(publishedAt, forKey: .publishedAt)
        //Parse channel Title
        try snippetContainer.encode(channelTitle, forKey: .channelTitle)
        //Parse thumbnails
        var thumbnailContainer = snippetContainer.nestedContainer(keyedBy: InfoKeys.self, forKey: .thumbnails)
        var highContainer = thumbnailContainer.nestedContainer(keyedBy: Keys.self, forKey: .high)
        try highContainer.encode(thumbnail, forKey: .thumbnail)
        //Parse Video Id
        try idContainer.encode(videoId, forKey: .videoId)
    }
}
