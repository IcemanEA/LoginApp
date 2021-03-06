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
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.systemBlue.cgColor]
        gradientLayer.frame = view.frame
        
        welcomeLabel.text = "Welcome,\n\(person.name)!"
        imageView.image = UIImage(named: person.image)
    }
    
    override func viewDidLayoutSubviews() {
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
}
