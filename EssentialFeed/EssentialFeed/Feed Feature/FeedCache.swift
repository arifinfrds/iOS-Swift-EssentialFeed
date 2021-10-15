//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 12/10/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public protocol FeedCache {
    typealias SaveResult = Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (SaveResult) -> Void)
}
