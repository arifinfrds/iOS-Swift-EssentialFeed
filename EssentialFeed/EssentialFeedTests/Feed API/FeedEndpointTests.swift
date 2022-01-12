//
//  FeedEndpointTests.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 12/01/22.
//  Copyright © 2022 arifinfrds. All rights reserved.
//

import XCTest
import EssentialFeed

class FeedEndpointTests: XCTestCase {
    
    func test_feed_endpointURL() {
        let baseURL = URL(string: "http://base-url.com")!
        
        let received = FeedEndpoint.get.url(baseURL: baseURL)
        let expected = URL(string: "http://base-url.com/v1/feed")!
        
        XCTAssertEqual(received, expected)
    }

}
