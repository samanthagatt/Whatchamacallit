//
//  AuthenticationView.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit
import GoogleSignIn

class AuthenticationView: UIView {
    
    enum AuthState {
        case login, createAccount
    }
    
    
    // MARK: Properties
    
    var authState: AuthState = .login
    
    
    // MARK: UI Elements
    
    var whatchamacallitLabel: UILabel = {
        return ViewManager.label(text: "Whatchamacallit", font: .preferredFont(forTextStyle: .largeTitle), textColor: .black, textAlignment: .center)
    }()
    
    var emailTextField: UITextField = {
        return ViewManager.textField(placeholder: "Email Address", borderStyle: .roundedRect, textContentType: .emailAddress, keyboardType: .emailAddress, autocapitalizationType: .none)
    }()
    
    var passwordTextField: UITextField = {
        return ViewManager.textField(placeholder: "Password", borderStyle: .roundedRect, isSecureTextEntry: true, autocapitalizationType: .none)
    }()
    
    var confirmPasswordTextField: UITextField?
    
    var submitButton: UIButton = {
        let button = UIButton().addStyling(backgroundColor: .blue)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var changeStateButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .caption1)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
    
    var googleSignInButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.style = .wide
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    
    // MARK: View setup and constraints
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .white
        
        passwordTextField.textContentType = authState == .login ? .password : .newPassword
        
        let changeStateButtonTitle = authState == .login ? "Don't have an account?\nSign up" : "Already have an account?\nSign in"
        changeStateButton.setTitle(changeStateButtonTitle, for: .normal)
        
        let submitButtonTitle = authState == .login ? "Log In" : "Sign Up"
        submitButton.setTitle(submitButtonTitle, for: .normal)
        
        addSubviews(whatchamacallitLabel, emailTextField, passwordTextField, submitButton, changeStateButton, leadingDivider, orLabel, trailingDivider, googleSignInButton)
        
        constrainViews()
    }
    
    private func constrainViews() {
        NSLayoutConstraint.activate([
            whatchamacallitLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            whatchamacallitLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            whatchamacallitLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            whatchamacallitLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            emailTextField.topAnchor.constraint(equalTo: whatchamacallitLabel.bottomAnchor, constant: 50),
            emailTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        var bottomTextField = passwordTextField
        
        if authState == .createAccount {
            let textField = ViewManager.textField(placeholder: "Confirm Password", borderStyle: .roundedRect, textContentType: .newPassword, isSecureTextEntry: true, autocapitalizationType: .none)
            confirmPasswordTextField = textField
            bottomTextField = textField
            
            addSubview(textField)
            confirmPasswordTextField?.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
            confirmPasswordTextField?.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
            confirmPasswordTextField?.widthAnchor.constraint(equalToConstant: 300).isActive = true
        }
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: bottomTextField.bottomAnchor, constant: 20),
            submitButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            changeStateButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            changeStateButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            orLabel.topAnchor.constraint(equalTo: changeStateButton.bottomAnchor, constant: 50),
            orLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            leadingDivider.leadingAnchor.constraint(equalTo: bottomTextField.leadingAnchor),
            leadingDivider.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -16),
            leadingDivider.heightAnchor.constraint(equalToConstant: 1),
            leadingDivider.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            
            trailingDivider.trailingAnchor.constraint(equalTo: bottomTextField.trailingAnchor),
            trailingDivider.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 16),
            trailingDivider.heightAnchor.constraint(equalToConstant: 1),
            trailingDivider.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
            
            googleSignInButton.topAnchor.constraint(equalTo: trailingDivider.bottomAnchor, constant: 50),
            googleSignInButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            googleSignInButton.widthAnchor.constraint(equalToConstant: 198)
        ])
        
    }
}
