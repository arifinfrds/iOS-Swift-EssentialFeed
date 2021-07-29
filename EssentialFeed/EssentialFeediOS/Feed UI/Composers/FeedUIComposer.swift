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
        
        let presenter = FeedPresenter(feedLoader: feedLoader)
        let refreshController = FeedRefreshViewController(presenter: presenter)
        let feedController = FeedViewController(refreshController: refreshController)
        presenter.loadingView = refreshController
        presenter.feedView = FeedViewAdapter(controller: feedController, imageLoader: imageLoader)
        
        return feedController
    }
}

private class FeedViewAdapter: FeedView {
    
    private weak var controller: FeedViewController?
    private let imageLoader: FeedImageDataLoader
    
    internal init(controller: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(feed: [FeedImage]) {
        
        controller?.tableModel = feed
            .map {
                let viewModel = FeedImageViewModel(model: $0, imageLoader: imageLoader, imageTransformer: UIImage.init)
                return FeedImageCellController(viewModel: viewModel)
            }
    }
}
