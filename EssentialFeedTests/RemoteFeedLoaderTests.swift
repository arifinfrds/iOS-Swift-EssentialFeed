//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 10/6/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import XCTest
@testable import EssentialFeed


class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}


class RemoteFeedLoaderTests: XCTestCase {

    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        let _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
}
