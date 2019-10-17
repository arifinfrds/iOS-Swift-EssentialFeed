//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 10/17/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
 
    public func load() {
        client.get(from: url)
    }
    
}

