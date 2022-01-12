//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 12/01/22.
//  Copyright © 2022 arifinfrds. All rights reserved.
//

import Foundation

public enum FeedEndpoint {
    case get
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
