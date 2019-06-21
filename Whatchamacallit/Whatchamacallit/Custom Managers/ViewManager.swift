//
//  ViewManager.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

enum ViewManager {
    
    static func label(text: String? = nil, attributedText: NSAttributedString? = nil, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment = .natural, lineBreakMode: NSLineBreakMode = .byTruncatingTail, numberOfLines: Int = 0, backgroundColor: UIColor = .clear, alpha: CGFloat = 1, tintColor: UIColor? = nil, clipsToBounds: Bool = true, mask: UIView? = nil, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, shadowOpacity: Float = 0, shadowRadius: CGFloat = 0, shadowOffset: CGSize = .zero, shadowColor: UIColor? = nil, shadowPath: CGPath? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        if let attributedText = attributedText {
            label.attributedText = attributedText
        }
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.lineBreakMode = lineBreakMode
        addStyling(to: label, backgroundColor: backgroundColor, alpha: alpha, clipsToBounds: clipsToBounds, mask: mask, cornerRadius: cornerRadius, borderWidth: borderWidth, borderColor: borderColor, shadowOpacity: shadowOpacity, shadowRadius: shadowRadius, shadowOffset: shadowOffset, shadowColor: shadowColor, shadowPath: shadowPath)
        return label
    }
    
    static func addStyling(to view: UIView, backgroundColor: UIColor = .clear, alpha: CGFloat = 1, clipsToBounds: Bool = false, mask: UIView? = nil, cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, shadowOpacity: Float = 0, shadowRadius: CGFloat = 0, shadowOffset: CGSize = .zero, shadowColor: UIColor? = nil, shadowPath: CGPath? = nil) {
        view.backgroundColor = backgroundColor
        view.alpha = alpha
        view.clipsToBounds = clipsToBounds
        view.mask = mask
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor.cgColor
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowColor = shadowColor?.cgColor
        view.layer.shadowPath = shadowPath
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
