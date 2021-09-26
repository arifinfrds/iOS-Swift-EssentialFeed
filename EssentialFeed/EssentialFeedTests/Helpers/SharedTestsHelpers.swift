//
//  SharedTestsHelpers.swift
//  EssentialFeedTests
//
//  Created by Arifin Firdaus on 04/03/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "Any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}
