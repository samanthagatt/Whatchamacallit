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
        return ViewManager.textField(placeholder: "Username", borderStyle: .roundedRect, textContentType: .username)
    }()
    var usernameWidthConstraint: NSLayoutConstraint?
    var usernameHeightContraint: NSLayoutConstraint?
    
    var passwordTextField: UITextField = {
        return ViewManager.textField(placeholder: "Password", borderStyle: .roundedRect, textContentType: .password, isSecureTextEntry: true)
    }()
    var passwordWidthConstraint: NSLayoutConstraint?
    var passwordHeightContraint: NSLayoutConstraint?
    
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
        scrollView.addSubviews(whatchamacallitLabel, usernameTextField, passwordTextField)
        
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
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        whatchamacallitTopConstraint = whatchamacallitLabel.topAnchor.constraint(equalTo: scrollView.topAnchor)
        whatchamacallitWidthConstraint = whatchamacallitLabel.widthAnchor.constraint(equalToConstant: 0)
        whatchamacallitHeightConstraint = whatchamacallitLabel.heightAnchor.constraint(equalToConstant: 0)
        
        usernameWidthConstraint = usernameTextField.widthAnchor.constraint(equalToConstant: 0)
        usernameHeightContraint = usernameTextField.heightAnchor.constraint(equalToConstant: 0)
        
        passwordWidthConstraint = passwordTextField.widthAnchor.constraint(equalToConstant: 0)
        passwordHeightContraint = passwordTextField.heightAnchor.constraint(equalToConstant: 0)
        
        let constraints = [whatchamacallitTopConstraint, whatchamacallitWidthConstraint, whatchamacallitHeightConstraint, usernameWidthConstraint, passwordWidthConstraint, passwordWidthConstraint]
        NSLayoutConstraint.activate(constraints.compactMap { $0 })
    }
    
    private func updateViewConstraints() {
        let contentWidth = scrollView.frame.width - 100
        whatchamacallitTopConstraint?.constant = safeAreaLayoutGuide.layoutFrame.height * 0.2
        whatchamacallitWidthConstraint?.constant = contentWidth
        whatchamacallitHeightConstraint?.constant = whatchamacallitLabel.sizeThatFits(CGSize(width: contentWidth, height: 10000)).height
        
        let preferredTextFieldWidth: CGFloat = 300
        let textFieldWidth: CGFloat = contentWidth >= preferredTextFieldWidth ? preferredTextFieldWidth : contentWidth
        usernameWidthConstraint?.constant = textFieldWidth
        usernameHeightContraint?.constant = usernameTextField.sizeThatFits(CGSize(width: textFieldWidth, height: 10000)).height
        
        passwordWidthConstraint?.constant = textFieldWidth
        passwordHeightContraint?.constant = passwordTextField.sizeThatFits(CGSize(width: textFieldWidth, height: 10000)).height
    }
}
