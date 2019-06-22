//
//  AuthenticationView.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class AuthenticationView: UIView {
    
    var whatchamacallitLabel: UILabel = {
        return ViewManager.label(text: "Whatchamacallit", font: .preferredFont(forTextStyle: .largeTitle), textColor: .black, textAlignment: .center)
    }()
    var whatchamacallitTopConstraint: NSLayoutConstraint?
    var whatchamacallitWidthConstraint: NSLayoutConstraint?
    var whatchamacallitHeightConstraint: NSLayoutConstraint?
    
    var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    var usernameWidthConstraint: NSLayoutConstraint?
    
    var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
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
        
        updateViewConstraints()
        scrollView.updateContentHeight()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.addSubviews(whatchamacallitLabel, usernameTextField)
        
        constrainViews()
    }
    
    private func constrainViews() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            whatchamacallitLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            usernameTextField.topAnchor.constraint(equalTo: whatchamacallitLabel.bottomAnchor, constant: 50),
            usernameTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
        
        whatchamacallitTopConstraint = whatchamacallitLabel.topAnchor.constraint(equalTo: scrollView.topAnchor)
        whatchamacallitWidthConstraint = whatchamacallitLabel.widthAnchor.constraint(equalToConstant: 0)
        whatchamacallitHeightConstraint = whatchamacallitLabel.heightAnchor.constraint(equalToConstant: 0)
        
        usernameWidthConstraint = usernameTextField.widthAnchor.constraint(equalToConstant: 0)
        
        let constraints = [whatchamacallitTopConstraint, whatchamacallitWidthConstraint, whatchamacallitHeightConstraint, usernameWidthConstraint]
        NSLayoutConstraint.activate(constraints.compactMap { $0 })
    }
    
    private func updateViewConstraints() {
        let contentWidth = scrollView.frame.width - 100
        whatchamacallitTopConstraint?.constant = safeAreaLayoutGuide.layoutFrame.height * 0.2
        whatchamacallitWidthConstraint?.constant = contentWidth
        whatchamacallitHeightConstraint?.constant = whatchamacallitLabel.sizeThatFits(CGSize(width: contentWidth, height: 10000)).height
        
        let preferredTextFieldWidth: CGFloat = 300
        let textFieldWidth: CGFloat = contentWidth >= preferredTextFieldWidth ? contentWidth : preferredTextFieldWidth
        usernameWidthConstraint?.constant = textFieldWidth
    }
}
