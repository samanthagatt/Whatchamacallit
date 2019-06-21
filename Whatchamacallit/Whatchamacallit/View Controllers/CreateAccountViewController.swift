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
        return AuthenticationView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainView.animateAppName()
    }
    
    func setupView() {
        view = mainView
    }
}
