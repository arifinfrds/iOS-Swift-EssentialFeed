//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 02/09/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    public static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
