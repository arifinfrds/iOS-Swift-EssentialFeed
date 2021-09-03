//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 03/09/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public struct FeedImageViewModel<Image> {
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        return location != nil
    }
}
