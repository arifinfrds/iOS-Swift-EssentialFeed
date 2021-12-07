//
//  ImageCommentsMapper.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 07/12/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

final class ImageCommentsMapper {
    
    private struct Root: Decodable {
        private let items: [Item]
        
        private struct Item: Decodable {
            let id: UUID
            let message: String
            let created_at: Date
            let author: Author
        }
        
        private struct Author: Decodable {
            let username: String
        }
        
        var comments: [ImageComment] {
             items.map { ImageComment(id: $0.id, message: $0.message, createdAt: $0.created_at, username: $0.author.username) }
         }
    }
    
    private static var OK_200 = 200
    
    static func map(_ data: Data, response: HTTPURLResponse) throws -> [ImageComment] {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        guard isOK(response), let root = try? decoder.decode(Root.self, from: data) else {
            throw RemoteImageCommentsLoader.Error.invalidData
        }
        
        return root.comments
    }
    
    static func isOK(_ response: HTTPURLResponse) -> Bool {
        (200...299).contains(response.statusCode)
    }
    
}