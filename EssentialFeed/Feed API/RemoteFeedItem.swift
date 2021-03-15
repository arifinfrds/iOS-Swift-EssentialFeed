//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 13/02/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
