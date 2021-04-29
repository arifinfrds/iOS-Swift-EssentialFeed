//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 10/6/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}

