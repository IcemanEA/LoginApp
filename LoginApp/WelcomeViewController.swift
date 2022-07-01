//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 01.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
        
    @IBOutlet var welcomeLabel: UILabel!
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(username ?? "")!"
    }
}
