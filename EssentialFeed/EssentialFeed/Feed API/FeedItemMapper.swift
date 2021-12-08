//
//  FeedItemMapper.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 25/12/20.
//  Copyright © 2020 arifinfrds. All rights reserved.
//

import Foundation

final class FeedItemsMapper {
    
    private struct Root: Decodable {
        private let items: [RemoteFeedItem]
        
        private struct RemoteFeedItem: Decodable {
            let id: UUID
            let description: String?
            let location: String?
            let image: URL
        }
        
        var images: [FeedImage] {
            items.map { FeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.image) }
        }

    }
    
    private static var OK_200 = 200
    
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedImage] {
        guard response.statusCode == OK_200, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
        return root.images
    }
    
}
