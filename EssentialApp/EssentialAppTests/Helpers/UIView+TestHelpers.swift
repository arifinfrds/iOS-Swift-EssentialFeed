//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Arifin Firdaus on 01/11/21.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
