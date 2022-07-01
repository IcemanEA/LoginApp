//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 01.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
        
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var gradientView: UIView!
    
    var username: String!
    
    private let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(username ?? "")!"
        
        gradientView.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.systemBlue.cgColor]
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.frame
    }
}
