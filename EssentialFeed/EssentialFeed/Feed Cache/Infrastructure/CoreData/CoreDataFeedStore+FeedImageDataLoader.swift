//
//  CoreDataFeedStore+FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 30/09/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

extension CoreDataFeedStore: FeedImageDataStore {

	public func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void) {

	}

	public func retrieve(dataForURL url: URL, completion: @escaping (RetrievalResult) -> Void) {
		completion(.success(.none))
	}
}
