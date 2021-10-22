//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Arifin Firdaus on 17/07/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
