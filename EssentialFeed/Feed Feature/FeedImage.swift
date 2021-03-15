//
//  FeedImage.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 10/6/19.
//  Copyright © 2019 arifinfrds. All rights reserved.
//

import Foundation

public struct FeedImage: Equatable {
    public let id: UUID
    public let description: String?
    public let location: String?
    public let url: URL
    
    public init(id: UUID, description: String?, location: String?, url: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.url = url
    }
}
