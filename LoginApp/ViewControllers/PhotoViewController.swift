//
//  PhotoViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 06.07.2022.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var image: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let image = image {
            imageView.image = UIImage(named: image)
        }
    }
}
