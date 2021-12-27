//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 03/09/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public final class FeedImagePresenter {
	public static func map(_ image: FeedImage) -> FeedImageViewModel {
		FeedImageViewModel(
			description: image.description,
			location: image.location)
	}
}
