//
//  ImageCommentsLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 01/01/22.
//  Copyright © 2022 arifinfrds. All rights reserved.
//

import XCTest
import EssentialFeed

class ImageCommentsLocalizationTests: XCTestCase {
	
	func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
		let table = "ImageComments"
		let bundle = Bundle(for: ImageCommentsPresenter.self)
		
		assertLocalizedKeyAndValuesExist(in: bundle, table)
	}
	
}
