//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus on 20/07/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation
import EssentialFeed

public final class FeedUIComposer {
    
    public static func feedComposeWith(
        feedLoader: FeedLoader,
        imageLoader: FeedImageDataLoader
    ) -> FeedViewController {
        
        let refreshController = FeedRefreshViewController(feedLoader: feedLoader)
        let feedController = FeedViewController(refreshController: refreshController)
        
        let adapter = RefreshControllerAdapter(
            adaptee: feedController,
            imageLoader: imageLoader
        )
        refreshController.onRefresh = adapter.adaptOnRefresh(_:)
        
        return feedController
    }
}

public final class RefreshControllerAdapter {
    
    private weak var adaptee: FeedViewController?
    private let imageLoader: FeedImageDataLoader
    
    public init(adaptee: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.adaptee = adaptee
        self.imageLoader = imageLoader
    }
    
    public func adaptOnRefresh(_ feed: [FeedImage]) {
        adaptee?.tableModel = feed
            .map { FeedImageCellController(model: $0, imageLoader: imageLoader) }
    }
}
