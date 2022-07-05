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
    @IBOutlet var imageView: UIImageView!
    
    var username: String!
    var image: String! = "iceman"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientView.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.systemBlue.cgColor]
        gradientLayer.frame = view.frame
        
        welcomeLabel.text = "Welcome,\n\(username ?? "")!"
        if let image = image {
            imageView.image = UIImage(named: image)
        }
    }
    
    override func viewDidLayoutSubviews() {
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
}
