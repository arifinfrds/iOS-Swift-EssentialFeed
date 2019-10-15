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
 
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
    
}

class HTTPClient {
    
    static var shared = HTTPClient()
        
    func get(from url: URL) {} 
    
}

class HTTPClientSpy: HTTPClient {
    
    var requestedURL: URL?
    
    override func get(from url: URL) {
        requestedURL = url
    }
    
}


class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doestNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
