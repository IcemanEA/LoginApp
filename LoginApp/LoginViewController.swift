//
//  ViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 01.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        userNameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        guard let loginVC = unwindSegue.destination as? LoginViewController else { return }
        loginVC.userNameTF.text = nil
        loginVC.passwordTF.text = nil
    }
    
    @IBAction func loginPressed() {
        print("what is it?")

        
    }
    
    @IBAction func hintPressed() {
        
    }
    
}

