//
//  UIScrollView+UpdateContentSize.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/22/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func updateContentHeight(padding: CGFloat = 0, withStaticWidth width: CGFloat? = nil) {
        let sortedViews = subviews.sorted { $0.frame.maxY < $1.frame.maxY }
        for view in sortedViews {
            print(view.frame.size)
            print(view)
        }
        let height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
        contentSize = CGSize(width: width ?? contentSize.width, height: height + padding)
    }
    
    func updateContentWidth(padding: CGFloat = 0, withStaticHeight height: CGFloat? = nil) {
        let width = subviews.sorted(by: { $0.frame.maxX < $1.frame.maxX }).last?.frame.maxX ?? contentSize.width
        contentSize = CGSize(width: width + padding, height: height ?? contentSize.height)
    }
    
    func updateContentSize(widthPadding: CGFloat = 0, heightPadding: CGFloat = 0) {
        updateContentHeight(padding: widthPadding)
        updateContentWidth(padding: heightPadding)
    }
}
