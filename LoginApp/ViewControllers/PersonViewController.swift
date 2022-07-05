//
//  PersonViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 06.07.2022.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    var about: String! = "Text"
    var name: String! = "firstName lastName"
    var image: String! = "iceman"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = name
        textView.text = about
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? PhotoViewController else { return }
        
        photoVC.image = image
    }
}
