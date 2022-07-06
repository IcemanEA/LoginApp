//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 01.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
        
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var username: String!
    var image: String! = "iceman"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
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
