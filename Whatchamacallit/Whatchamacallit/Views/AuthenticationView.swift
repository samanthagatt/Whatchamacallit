//
//  AuthenticationView.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class AuthenticationView: UIView {
    
    enum AuthState {
        case login, createAccount
    }
    
    
    // MARK: Properties
    
    var authState: AuthState = .login
    
    
    // MARK: UI Elements
    
    var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var whatchamacallitLabel: UILabel = {
        return ViewManager.label(text: "Whatchamacallit", font: .preferredFont(forTextStyle: .largeTitle), textColor: .black, textAlignment: .center)
    }()
    private var whatchamacallitTopConstraint: NSLayoutConstraint?
    private var whatchamacallitWidthConstraint: NSLayoutConstraint?
    private var whatchamacallitHeightConstraint: NSLayoutConstraint?
    
    var usernameTextField: UITextField = {
        return ViewManager.textField(placeholder: "Username", borderStyle: .roundedRect, textContentType: .username)
    }()
    private var usernameWidthConstraint: NSLayoutConstraint?
    private var usernameHeightConstraint: NSLayoutConstraint?
    
    var passwordTextField: UITextField = {
        return ViewManager.textField(placeholder: "Password", borderStyle: .roundedRect, textContentType: .password, isSecureTextEntry: true)
    }()
    private var passwordWidthConstraint: NSLayoutConstraint?
    private var passwordHeightConstraint: NSLayoutConstraint?
    
    var confirmPasswordTextField: UITextField?
    private var confirmPasswordWidthConstraint: NSLayoutConstraint?
    private var confirmPasswordHeightConstraint: NSLayoutConstraint?
    
    var orLabel: UILabel = {
        return ViewManager.label(text: "OR", font: .preferredFont(forTextStyle: UIFont.TextStyle.caption2), textColor: .lightGray)
    }()
    
    var leadingDivider: UIView = {
        let view = UIView().addStyling(backgroundColor: .lightGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var trailingDivider: UIView = {
        let view = UIView().addStyling(backgroundColor: .lightGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    init(state: AuthState) {
        super.init(frame: .zero)
        
        self.authState = state
        setupView()
    }
    
    
    // MARK: Layout and Setup
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateDynamicConstraints()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.addSubviews(whatchamacallitLabel, usernameTextField, passwordTextField, leadingDivider, orLabel, trailingDivider)
        
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
        
        var bottomView = passwordTextField
        
        if authState == .createAccount {
            let view = ViewManager.textField(placeholder: "Confirm Password", borderStyle: .roundedRect, textContentType: .newPassword)
            confirmPasswordTextField = view
            bottomView = view
            
            scrollView.addSubview(view)
            confirmPasswordTextField?.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
            confirmPasswordTextField?.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        }
        
        let orLabelSize = orLabel.sizeThatFits(CGSize(width: 1000, height: 1000))
        NSLayoutConstraint.activate([
            orLabel.topAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 50),
            orLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            orLabel.widthAnchor.constraint(equalToConstant: orLabelSize.width),
            orLabel.heightAnchor.constraint(equalToConstant: orLabelSize.height),
            
            leadingDivider.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -16),
            leadingDivider.heightAnchor.constraint(equalToConstant: 1),
            leadingDivider.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            leadingDivider.widthAnchor.constraint(equalToConstant: 120),
            
            trailingDivider.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 16),
            trailingDivider.heightAnchor.constraint(equalToConstant: 1),
            trailingDivider.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            trailingDivider.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        activateDynamicConstraints()
    }
    
    private func activateDynamicConstraints() {
        whatchamacallitTopConstraint = whatchamacallitLabel.topAnchor.constraint(equalTo: scrollView.topAnchor)
        whatchamacallitWidthConstraint = whatchamacallitLabel.widthAnchor.constraint(equalToConstant: 0)
        whatchamacallitHeightConstraint = whatchamacallitLabel.heightAnchor.constraint(equalToConstant: 0)
        
        usernameWidthConstraint = usernameTextField.widthAnchor.constraint(equalToConstant: 0)
        usernameHeightConstraint = usernameTextField.heightAnchor.constraint(equalToConstant: 0)
        
        passwordWidthConstraint = passwordTextField.widthAnchor.constraint(equalToConstant: 0)
        passwordHeightConstraint = passwordTextField.heightAnchor.constraint(equalToConstant: 0)
        
        confirmPasswordWidthConstraint = confirmPasswordTextField?.widthAnchor.constraint(equalToConstant: 0)
        confirmPasswordHeightConstraint = confirmPasswordTextField?.heightAnchor.constraint(equalToConstant: 0)
        
        let constraints = [whatchamacallitTopConstraint, whatchamacallitWidthConstraint, whatchamacallitHeightConstraint, usernameWidthConstraint, usernameHeightConstraint, passwordWidthConstraint, passwordHeightConstraint, confirmPasswordWidthConstraint, confirmPasswordHeightConstraint]
        NSLayoutConstraint.activate(constraints.compactMap { $0 })
    }
    
    private func updateDynamicConstraints() {
        let contentWidth = scrollView.frame.width - 100
        whatchamacallitTopConstraint?.constant = safeAreaLayoutGuide.layoutFrame.height * 0.2
        whatchamacallitWidthConstraint?.constant = contentWidth
        whatchamacallitHeightConstraint?.constant = whatchamacallitLabel.sizeThatFits(CGSize(width: contentWidth, height: 10000)).height
        
        let preferredTextFieldWidth: CGFloat = 300
        let textFieldWidth: CGFloat = contentWidth >= preferredTextFieldWidth ? preferredTextFieldWidth : contentWidth
        usernameWidthConstraint?.constant = textFieldWidth
        usernameHeightConstraint?.constant = usernameTextField.sizeThatFits(CGSize(width: textFieldWidth, height: 10000)).height + 10
        
        passwordWidthConstraint?.constant = textFieldWidth
        passwordHeightConstraint?.constant = passwordTextField.sizeThatFits(CGSize(width: textFieldWidth, height: 10000)).height + 10
        
        let confirmHeight = confirmPasswordTextField?.sizeThatFits(CGSize(width: textFieldWidth, height: 10000)).height ?? 0
        confirmPasswordWidthConstraint?.constant = textFieldWidth
        confirmPasswordHeightConstraint?.constant = confirmHeight + 10
    }
}
