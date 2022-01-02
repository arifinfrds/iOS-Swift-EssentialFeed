//
//  UITableView+HeaderSizing.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus on 25/10/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import UIKit

extension UITableView {
    func sizeTableHeaderToFit() {
        guard let header = tableHeaderView else { return }
        
        let size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        let needsFrameUpdate = header.frame.height != size.height
        if needsFrameUpdate {
            header.frame.size.height = size.height
            tableHeaderView = header
        }
    }
}
