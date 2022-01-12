//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 12/01/22.
//  Copyright © 2022 arifinfrds. All rights reserved.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("v1/image/2239CBA2-CB35-4392-ADC0-24A37D38E010/comments")
        }
    }
}
