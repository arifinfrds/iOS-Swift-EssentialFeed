//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 07/12/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
