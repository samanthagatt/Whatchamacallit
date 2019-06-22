//
//  UIScrollView+UpdateContentSize.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/22/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func updateContentHeight(padding: CGFloat = 0) {
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height + padding
    }
    
    func updateContentWidth(padding: CGFloat = 0) {
        contentSize.width = subviews.sorted(by: { $0.frame.maxX < $1.frame.maxX }).last?.frame.maxX ?? contentSize.width + padding
    }
    
    func updateContentSize(widthPadding: CGFloat = 0, heightPadding: CGFloat = 0) {
        updateContentHeight(padding: widthPadding)
        updateContentWidth(padding: heightPadding)
    }
}
