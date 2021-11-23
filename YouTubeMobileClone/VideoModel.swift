//
//  VideoModel.swift
//  YouTubeMobileClone
//
//  Created by Ayodejii Ayankola on 19/11/2021.
//

import Foundation

struct VideoModel: Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var publishedDate = Date()
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case publishedDate = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        // Parse the title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse the description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the published Date
        self.publishedDate = try snippetContainer.decode(Date.self, forKey: .publishedDate)
   
        // Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // parse videoId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
