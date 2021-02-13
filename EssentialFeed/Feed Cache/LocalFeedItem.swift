//
//  LocalFeedItem.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 13/02/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public struct LocalFeedItem: Equatable {
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
