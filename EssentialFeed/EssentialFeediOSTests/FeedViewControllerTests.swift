//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Arifin Firdaus on 07/05/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import XCTest
import UIKit

class FeedViewController: UIViewController {
    private var loader: FeedViewControllerTests.LoaderSpy?
    
    convenience init(loader: FeedViewControllerTests.LoaderSpy) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader?.loadFeed()
    }
}

class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    func test_viewDidLoad_loadFeed() {
        let loader = LoaderSpy()
        let sut = FeedViewController(loader: loader)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(loader.loadCallCount, 1)
    }
    
    // MARK: - Helpers
    
    class LoaderSpy {
        private(set) var loadCallCount: Int = 0
        
        func loadFeed() {
            loadCallCount += 1
        }
    }
    
}
