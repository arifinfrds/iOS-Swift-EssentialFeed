//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 10/6/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation

public enum LoadFeedResult {
    case success(_ items: [FeedImage])
    case failure(_ error: Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

