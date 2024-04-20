//
//  Extensions.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func addToWindow()  {
        let window = UIApplication.shared.keyWindow!
        self.frame = window.bounds
        window.addSubview(self)
    }
    
    enum RoundCornersAt{
        case topRight
        case topLeft
        case bottomRight
        case bottomLeft
    }
    
    func roundCorners(corners:[RoundCornersAt], radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [
            corners.contains(.topRight) ? .layerMaxXMinYCorner:.init(),
            corners.contains(.topLeft) ? .layerMinXMinYCorner:.init(),
            corners.contains(.bottomRight) ? .layerMaxXMaxYCorner:.init(),
            corners.contains(.bottomLeft) ? .layerMinXMaxYCorner:.init(),
        ]
    }
    
    func addShadow(with color: CGColor = UIColor.black.cgColor) {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = false
    }
    
    
    func addTopShadow(with color: CGColor = UIColor.black.cgColor) {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: -4, height: -4)
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = false
    }
    func addLeftBottomShadow(with color: CGColor = UIColor.black.cgColor) {
        self.layer.shadowColor = color
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: -4, height: 4)
        self.layer.shadowRadius = 6
        self.layer.masksToBounds = false
    }
}
