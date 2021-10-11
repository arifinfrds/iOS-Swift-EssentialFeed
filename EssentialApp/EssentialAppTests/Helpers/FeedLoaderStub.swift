//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Arifin Firdaus on 11/10/21.
//

import EssentialFeed

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
