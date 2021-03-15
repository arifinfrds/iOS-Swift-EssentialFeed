//
//  XCTestsCase+FeedStoreSpecs.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 15/03/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import XCTest
import EssentialFeed

extension FeedStoreSpecs where Self: XCTestCase {
    
    @discardableResult
    func insert(_ cache: (feed: [LocalFeedImage], timestamp: Date), to sut: FeedStore) -> Error? {
        var capturedError: Error?
        let exp = expectation(description: "Wait for completion")
        sut.insert(cache.feed, timestamp: cache.timestamp) { error in
            capturedError = error
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
        return capturedError
    }
    
    @discardableResult
    func deleteCache(from sut: FeedStore) -> Error? {
        var capturedError: Error?
        
        let exp = expectation(description: "Wait for cache deletion")
        sut.deleteCachedFeed { deletionError in
            capturedError = deletionError
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
        
        return capturedError
    }
    
    func expect(_ sut: FeedStore, toRetrieveTwice expectedResult: RetrieveCachedFeedResult, file: StaticString = #filePath, line: UInt = #line) {
        expect(sut, toRetrieve: expectedResult, file: file, line: line)
        expect(sut, toRetrieve: expectedResult, file: file, line: line)
    }
    
    func expect(_ sut: FeedStore, toRetrieve expectedResult: RetrieveCachedFeedResult, file: StaticString = #filePath, line: UInt = #line) {
        let exp = expectation(description: "Wait for completion")
        
        sut.retrieve { retrievedResult in
            switch (retrievedResult, expectedResult) {
            case (.empty, .empty),
                 (.failure, .failure):
                break
            case (let .found(retrievedFeed, retrievedTimestamp), let .found(expectedFeed, expectedTimestamp)):
                XCTAssertEqual(retrievedFeed, expectedFeed, file: file, line: line)
                XCTAssertEqual(retrievedTimestamp, expectedTimestamp, file: file, line: line)
            default:
                XCTFail("Expect to retrieve \(expectedResult), got \(retrievedResult) instead.")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1.0)
    }
}
