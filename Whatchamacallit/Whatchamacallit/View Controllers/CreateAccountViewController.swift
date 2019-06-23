//
//  CreateAccountViewController.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit
import GoogleSignIn

class CreateAccountViewController: UIViewController, GIDSignInUIDelegate {
    
    var mainView: AuthenticationView = {
        return AuthenticationView(state: .createAccount)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
//        GIDSignIn.sharedInstance()?.signIn()
        
        setupView()
    }
    
    func setupView() {
        view = mainView
    }
}
