//
//  LocalFeedImageDataLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 29/09/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import XCTest
import EssentialFeed

final class LocalFeedImageDataLoader {
	init(store: Any) {
		
	}
}

class LocalFeedImageDataLoaderTests: XCTestCase {
	
	func test_init_doesNotMessageStoreUponCreation() {
		let (_, store) = makeSUT()
		
		XCTAssertTrue(store.receivedMessages.isEmpty)
	}
	
	// MARK: - Helpers
	
	private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedImageDataLoader, store: FeedStoreSpy) {
		let store = FeedStoreSpy()
		let sut = LocalFeedImageDataLoader(store: store)
		trackForMemoryLeaks(for: store, file: file, line: line)
		trackForMemoryLeaks(for: sut, file: file, line: line)
		return (sut, store)
	}
	
	private class FeedStoreSpy {
		let receivedMessages = [Any]()
	}
	
}
