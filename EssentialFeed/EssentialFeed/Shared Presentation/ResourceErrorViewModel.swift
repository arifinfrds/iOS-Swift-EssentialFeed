//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 27/12/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import Foundation

public struct ResourceErrorViewModel {
	public let message: String?
	
	static var noError: ResourceErrorViewModel {
		return ResourceErrorViewModel(message: nil)
	}
	
	static func error(message: String) -> ResourceErrorViewModel {
		return ResourceErrorViewModel(message: message)
	}
}
