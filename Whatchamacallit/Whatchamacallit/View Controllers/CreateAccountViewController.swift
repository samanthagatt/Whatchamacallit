//
//  CreateAccountViewController.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class CreateAccountViewController: UIViewController, GIDSignInUIDelegate {
    
    var mainView: AuthenticationView = {
        return AuthenticationView(state: .createAccount)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.uiDelegate = self

        setupView()
    }
    
    func setupView() {
        view = mainView
        mainView.submitButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }
    
    @objc func createAccount() {
        guard let email = mainView.emailTextField.text, !email.isEmpty,
            let password = mainView.passwordTextField.text, !password.isEmpty,
            let confirmPassword = mainView.confirmPasswordTextField?.text, !confirmPassword.isEmpty else {
            
                return
        }
        
        guard password == confirmPassword else {
            
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                print("ERROR SIGNING IN WITH EMAIL AND PASSWORD:", error)
                return
            }
        }
    }
}
