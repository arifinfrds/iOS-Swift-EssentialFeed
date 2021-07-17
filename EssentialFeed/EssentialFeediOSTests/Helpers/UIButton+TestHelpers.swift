//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Arifin Firdaus on 17/07/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
