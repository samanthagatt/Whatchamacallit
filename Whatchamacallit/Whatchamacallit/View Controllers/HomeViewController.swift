//
//  HomeViewController.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/22/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    var label: UILabel = {
        return ViewManager.label(text: "YOU'RE LOGGED IN", font: .preferredFont(forTextStyle: .largeTitle), textColor: .black, textAlignment: .center, numberOfLines: 0)
    }()
    
    var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubviews(label, logoutButton)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 100),
            label.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            logoutButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    @objc func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let error as NSError {
            print("ERROR SIGNING OUT:", error)
            return
        }
    }
}
