//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus on 20/07/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation
import UIKit
import EssentialFeed

public final class FeedUIComposer {
    
    public static func feedComposeWith(
        feedLoader: FeedLoader,
        imageLoader: FeedImageDataLoader
    ) -> FeedViewController {
        
        let feedViewModel = FeedViewModel(feedLoader: feedLoader)
        let refreshController = FeedRefreshViewController(viewModel: feedViewModel)
        let feedController = FeedViewController(refreshController: refreshController)
        feedViewModel.onFeedLoad = adaptFeedToCellControllers(forwardingTo: feedController, imageLoader: imageLoader)
        
        return feedController
    }
    
    private static func adaptFeedToCellControllers(
        forwardingTo controller: FeedViewController,
        imageLoader: FeedImageDataLoader
    ) -> (([FeedImage]) -> Void) {
        
        return { [weak controller] feed in
            controller?.tableModel = feed
                .map {
                    FeedImageCellController(viewModel: FeedImageViewModel(model: $0, imageLoader: imageLoader, imageTransformer: UIImage.init))
                }
        }
    }
}
