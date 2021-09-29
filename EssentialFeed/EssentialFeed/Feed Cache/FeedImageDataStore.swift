//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 29/09/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public protocol FeedImageDataStore {
	typealias Result = Swift.Result<Data?, Error>

	func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
