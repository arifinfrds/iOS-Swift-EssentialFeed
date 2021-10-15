//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 15/10/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
