//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus on 26/07/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
