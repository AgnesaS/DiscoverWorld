//
//  UIView+Extension.swift
//  App
//
//  Created by FatjonaHoti  on 13.3.23.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat{
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

