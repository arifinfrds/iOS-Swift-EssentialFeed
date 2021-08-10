//
//  FeedViewControllerTests+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Arifin Firdaus on 10/08/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation
import XCTest
import EssentialFeediOS

extension FeedViewControllerTests {
    
    func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedViewController.self)
        let localizedTitle = bundle.localizedString(forKey: key, value: nil, table: table)
        
        if key == localizedTitle {
            XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        }
        return localizedTitle
    }
    
}
