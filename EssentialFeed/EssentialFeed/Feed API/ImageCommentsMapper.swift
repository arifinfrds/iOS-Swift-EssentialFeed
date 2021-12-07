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
        let items: [RemoteFeedItem]
    }
    
    private static var OK_200 = 200

    static func map(_ data: Data, response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard
            response.statusCode == OK_200,
            let root = try? JSONDecoder().decode(Root.self, from: data)
        else {
            throw RemoteImageCommentsLoader.Error.invalidData
        }
        return root.items
    }
    
}
