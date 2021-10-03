//
//  CoreDataFeedStore+FeedStore.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 03/10/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

extension CoreDataFeedStore: FeedStore {
	
	public func retrieve(completion: @escaping RetrievalCompletion) {
		perform { context in
			completion(Result {
				try ManagedCache
					.find(in: context)
					.map { CachedFeed(feed: $0.localFeed, timestamp: $0.timestamp) }
			})
		}
	}
	
	public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
		perform { context in
			completion(.init(catching: {
				let managedCache = try ManagedCache.newUniqueInstance(in: context)
				managedCache.timestamp = timestamp
				managedCache.feed = ManagedFeedImage.images(from: feed, in: context)
				
				try context.save()
			}))
		}
	}
	
	public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
		perform { context in
			completion(Result {
				try ManagedCache.find(in: context)
					.map(context.delete)
					.map(context.save)
			})
		}
	}
	
}
