//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 10/17/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
    
}
