//
//  FeedLocalizationTests.swift
//  EssentialFeediOSTests
//
//  Created by Arifin Firdaus on 12/08/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import XCTest
import EssentialFeed

class FeedLocalizationTests: XCTestCase {
	
	func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
		let table = "Feed"
		let bundle = Bundle(for: FeedPresenter.self)
		assertLocalizedKeyAndValuesExist(in: bundle, table)
	}
	
}
