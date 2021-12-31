//
//  ImageCommentsPresenter.swift
//  EssentialFeed
//
//  Created by Arifin Firdaus on 01/01/22.
//  Copyright © 2022 arifinfrds. All rights reserved.
//

import Foundation

public final class ImageCommentsPresenter {
	public static var title: String {
		NSLocalizedString("IMAGE_COMMENTS_VIEW_TITLE",
						  tableName: "ImageComments",
						  bundle: Bundle(for: Self.self),
						  comment: "Title for the image comments view")
	}
}
