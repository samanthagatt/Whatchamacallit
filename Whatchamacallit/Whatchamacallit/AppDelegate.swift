//
//  AppDelegate.swift
//  Whatchamacallit
//
//  Created by Samantha Gatt on 6/20/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance()?.delegate = self
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            let vc = user != nil ? HomeViewController() : CreateAccountViewController()
            let newWindow = UIWindow(frame: UIScreen.main.bounds)
            newWindow.rootViewController = vc
            newWindow.makeKeyAndVisible()
            self.window = newWindow
        }
        
        /*
         DefinitionController().getRandomWordWithDefinition { (definitions, error) in
             if let error = error {
                 print(error)
                 return
             }
             guard let word = definitions.first?.word else {
                 print("no word")
                 return
             }
             print("Word:", word)
             print("Definitions:", definitions.compactMap { $0.attributedText })
         }
         */
        
        return true
    }

    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credentials) { (authDataResult, error) in
            if let error = error {
                print("THERE WAS AN ERROR SIGNING IN:", error)
                return
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print("THERE WAS AN ERROR SIGNING OUT:", error)
            return
        }
    }
}

