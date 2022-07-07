//
//  PersonViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 06.07.2022.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = person.name
        textView.text = person.about
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? PhotoViewController else { return }
        
        photoVC.image = person.image
    }
}
