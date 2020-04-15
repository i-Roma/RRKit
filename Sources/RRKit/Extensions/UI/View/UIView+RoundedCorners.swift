//
//  UIView+RoundedCorners.swift
//

import UIKit

extension UIView {
    
    func round(radius: CGFloat = 0, clipsToBounds: Bool = true) {
        let cornerRadius = radius == 0 ? self.bounds.width / 2 : radius
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = clipsToBounds
    }
    
    func corner(radius: CGFloat, clipsToBounds: Bool = true) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = clipsToBounds
    }
    
}

