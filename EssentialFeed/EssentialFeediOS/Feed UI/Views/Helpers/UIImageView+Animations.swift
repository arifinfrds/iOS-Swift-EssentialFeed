//
//  UIImageView+Animations.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus on 06/08/21.
//  Copyright © 2021 arifinfrds. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImageAnimated(_ newImage: UIImage?) {
        image = newImage
        
        guard newImage != nil else { return }
        
        alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
    
}

