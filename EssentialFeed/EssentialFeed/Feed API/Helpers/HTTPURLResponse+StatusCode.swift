//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 26/09/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
