//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 08/02/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import XCTest

class LocalFeedLoader {
    private let store: FeedStore
    
    init(store: FeedStore) {
        self.store = store
    }
}

class FeedStore {
    var deleteCacheFeedCallCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {

    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
    
        XCTAssertEqual(store.deleteCacheFeedCallCount, 0)
    }
    
}
