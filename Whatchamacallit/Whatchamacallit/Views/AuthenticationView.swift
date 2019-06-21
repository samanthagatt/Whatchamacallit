//
//  AuthenticationView.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/21/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class AuthenticationView: UIView {
    
    private var appNameStackView: UIStackView = {
        let appName = "Whatchamacallit"
        var labels: [UILabel] = []
        for char in appName {
            labels.append(ViewManager.label(text: String(char), font: .systemFont(ofSize: 30, weight: .bold), textColor: .black))
        }
        labels.first?.textAlignment = .right
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false

        backgroundColor = .white
        
        addSubview(appNameStackView)
        NSLayoutConstraint.activate([
            appNameStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            appNameStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            appNameStackView.widthAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.widthAnchor, constant: -60)
        ])
    }
    
    func animateAppName() {
        var delay: TimeInterval = 0
        for subview in appNameStackView.arrangedSubviews {
            UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                subview.transform = CGAffineTransform(translationX: 0, y: -30)
            }) { _ in
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    subview.transform = CGAffineTransform(translationX: 0, y: 10)
                }) { _ in
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                        subview.transform = .identity
                    })
                }
            }
            delay += 0.1
        }
    }
}
