//
//  ViewManager.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

enum ViewManager {
    
    /**
     Creates a customized UILabel
     
     Use this function when creating a new label
     - Note: Chain `addStyling()` `UIView` instance method to customize UIView properties as well
     - Author: Samantha Gatt
     - Parameters:
         - text: The current text that is displayed by the label.
         - attributedText: The current styled text that is displayed by the label.
         - font: The font used to display the text.
         - textColor: The color of the text.
         - textAlignment: The technique to use for aligning the text.
         - lineBreakMode: The technique to use for wrapping and truncating the label’s text.
         - numberOfLines: The maximum number of lines to use for rendering text.
     */
    static func label(text: String? = nil, attributedText: NSAttributedString? = nil, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment = .natural, lineBreakMode: NSLineBreakMode = .byTruncatingTail, numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        if let attributedText = attributedText {
            label.attributedText = attributedText
        }
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.lineBreakMode = lineBreakMode
        label.numberOfLines = numberOfLines
        return label
    }
    
    static func textField() -> UITextField {
        let textField = UITextField()
        
        return textField
    }
}
