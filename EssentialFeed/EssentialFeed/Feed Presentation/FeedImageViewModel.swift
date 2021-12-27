//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 03/09/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public struct FeedImageViewModel {
	public let description: String?
	public let location: String?
	
	public var hasLocation: Bool {
		return location != nil
	}
}
