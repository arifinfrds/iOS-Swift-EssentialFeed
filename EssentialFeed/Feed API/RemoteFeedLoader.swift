//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 10/17/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation


public final class RemoteFeedLoader: FeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    public typealias Result = LoadFeedResult
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load(completion: @escaping ((Result) -> Void)) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case let .success(data, response):
                do {
                    let items = try FeedItemsMapper.map(data, response: response)
                    completion(.success(items.toLocal()))
                } catch {
                    completion(.failure(error))
                }
            case .failure(_):
                completion(.failure(Error.connectivity))
            }
        }
    }
}

private extension Array where Element == RemoteFeedItem {
    
    func toLocal() -> [FeedItem] {
        return map { FeedItem(id: $0.id, description: $0.description, location: $0.location, url: $0.image) }
    }
}

