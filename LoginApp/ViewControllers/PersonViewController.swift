//
//  PersonViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 06.07.2022.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    var openUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = openUser.person.name
        textView.text = openUser.person.about
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? PhotoViewController else { return }
        
        photoVC.image = openUser.person.image
    }
}
