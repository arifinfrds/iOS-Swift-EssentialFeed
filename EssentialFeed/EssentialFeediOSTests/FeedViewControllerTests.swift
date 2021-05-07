//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Arifin Firdaus on 07/05/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import XCTest

class FeedViewController {
    init(loader: FeedViewControllerTests.LoaderSpy) {
        
    }
}

class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    // MARK: - Helpers
    
    class LoaderSpy {
        private(set) var loadCallCount: Int = 0
    }
    
}
