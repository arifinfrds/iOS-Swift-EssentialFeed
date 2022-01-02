//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus (Personal) on 02/01/22.
//  Copyright © 2022 arifinfrds. All rights reserved.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
