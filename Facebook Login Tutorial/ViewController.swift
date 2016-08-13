//
//  ViewController.swift
//  Facebook Login Tutorial
//
//  Created by Michael Henry on 6/24/15.
//  Copyright (c) 2015 Digital Javelina, LLC. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            println("Not logged in")
        } else {
            println("Logged in")
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Facebook login
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            println("Login successful.")
            self.performSegueWithIdentifier("showNew", sender: self)
        } else {
            println(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User logged out")
    }


}

