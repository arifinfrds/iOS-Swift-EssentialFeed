//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus on 26/07/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation
import EssentialFeed

final class FeedViewModel {
    
    private let feedLoader: FeedLoader
    
    internal init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var onChange: ((FeedViewModel) -> Void)?
    var onFeedLoad: (([FeedImage]) -> Void)?
    
    private(set) var isLoading: Bool = false {
        didSet { onChange?(self) }
    }
    
    func loadFeed() {
        
        isLoading = true
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.isLoading = false
        }
    }
}
