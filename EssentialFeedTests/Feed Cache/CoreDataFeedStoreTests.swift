//
//  CoreDataFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 21/03/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import XCTest
import EssentialFeed

final class CoreDataFeedStore: FeedStore {
    
    func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
}

class CoreDataFeedStoreTests: XCTestCase, FeedStoreSpecs {
    
    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = makeSUT()
        
        assertThatRetrieveDeliversEmptyOnEmptyCache(on: sut)
    }
    
    func test_retrieve_hasNoSideEffectsOnEmptyCache() {
        
    }
    
    func test_retrieve_deliversFoundValuesOnNonEmptyCache() {
        
    }
    
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache() {
        
    }
    
    func test_insert_deliversNoErrorOnEmptyCache() {
        
    }
    
    func test_insert_deliversNoErrorOnNonEmptyCache() {
        
    }
    
    func test_insert_overridesPreviouslyInsertedCacheValues() {
        
    }
    
    func test_delete_deliversNoErrorOnEmptyCache() {
    
    }
    
    func test_delete_hasNoSideEffectsOnEmptyCache() {
        
    }
    
    func test_delete_deliversNoErrorOnNonEmptyCache() {
        
    }
    
    func test_delete_emptiesPreviouslyInsertedCache() {
        
    }
    
    func test_storeSideEffects_runSerially() {
        
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> CoreDataFeedStore {
        let sut = CoreDataFeedStore()
        return sut
    }
        
}
