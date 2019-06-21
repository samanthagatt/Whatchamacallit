//
//  AuthenticationView.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class AuthenticationView: UIView {
    
    var label: UILabel = {
        return ViewManager.label(text: "Hello world", font: .preferredFont(forTextStyle: .largeTitle), textColor: .black, textAlignment: .center)
    }()
    
    var labelWidthConstraint: NSLayoutConstraint?
    var labelHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let contentWidth = frame.width - 30
        labelWidthConstraint?.constant = contentWidth
        labelHeightConstraint?.constant = label.sizeThatFits(CGSize(width: contentWidth, height: 10000)).height
        
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
        
        labelWidthConstraint = label.widthAnchor.constraint(equalToConstant: 0)
        labelWidthConstraint?.isActive = true
        labelHeightConstraint = label.heightAnchor.constraint(equalToConstant: 0)
        labelHeightConstraint?.isActive = true
    }
}
