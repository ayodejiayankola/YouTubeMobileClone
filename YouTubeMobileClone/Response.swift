//
//  Response.swift
//  YouTubeMobileClone
//
//  Created by Ayodejii Ayankola on 24/11/2021.
//

import Foundation

struct Response: Decodable {
    
    var items: [VideoModel]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    init(from decoder: Decoder) throws {
        let container =  try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([VideoModel].self, forKey: .items)
    }
}
