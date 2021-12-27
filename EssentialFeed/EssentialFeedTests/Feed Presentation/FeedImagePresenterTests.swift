//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 02/09/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import XCTest
import EssentialFeed

class FeedImagePresenterTests: XCTestCase {
	
	func test_map_createsViewModel() {
		let image = uniqueImage()
		
		let viewModel = FeedImagePresenter.map(image)
		
		XCTAssertEqual(viewModel.description, image.description)
		XCTAssertEqual(viewModel.location, image.location)
	}

}
