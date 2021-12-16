//
//  XCTestCase+MemoryLeakTracker.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 25/12/20.
//  Copyright © 2020 arifinfrds. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potental memory leaks.", file: file, line: line)
        }
    }
    
}
