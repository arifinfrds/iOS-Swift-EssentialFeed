//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus on 06/08/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
    
}

