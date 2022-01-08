//
//  UIView+Container.swift
//  EssentialFeediOS
//
//  Created by Arifin Firdaus on 08/01/22.
//  Copyright © 2022 arifinfrds. All rights reserved.
//

import UIKit

 extension UIView {

     public func makeContainer() -> UIView {
         let container = UIView()
         container.backgroundColor = .clear
         container.addSubview(self)

         translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
             leadingAnchor.constraint(equalTo: container.leadingAnchor),
             container.trailingAnchor.constraint(equalTo: trailingAnchor),
             topAnchor.constraint(equalTo: container.topAnchor),
             container.bottomAnchor.constraint(equalTo: bottomAnchor),
         ])

         return container
     }

 }
