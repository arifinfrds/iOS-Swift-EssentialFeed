//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus on 17/07/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
