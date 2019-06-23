//
//  CreateAccountViewController.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    var mainView: AuthenticationView = {
        return AuthenticationView(state: .createAccount)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view = mainView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("CONTENT SIZE BEFORE:", mainView.scrollView.contentSize)
        mainView.scrollView.updateContentHeight(padding: 20, withStaticWidth: mainView.scrollView.frame.width)
        print("CONTENT SIZE AFTER:", mainView.scrollView.contentSize)
        print("VIEW SIZE:", mainView.scrollView.frame)
    }
}
