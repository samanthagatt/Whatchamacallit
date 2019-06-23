//
//  HomeViewController.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/22/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var label: UILabel = {
        return ViewManager.label(text: "YOU'RE LOGGED IN", font: .preferredFont(forTextStyle: .largeTitle), textColor: .black, textAlignment: .center, numberOfLines: 0)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 100),
            label.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }
}
