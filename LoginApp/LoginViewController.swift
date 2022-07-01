//
//  ViewController.swift
//  LoginApp
//
//  Created by Egor Ledkov on 01.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    let username = "Debash"
    let password = "1234"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        usernameTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.username = usernameTF.text
    }

    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        guard let loginVC = unwindSegue.destination as? LoginViewController else { return }
        loginVC.usernameTF.text = nil
        loginVC.passwordTF.text = nil
    }
    
    @IBAction func loginPressed() {
        if usernameTF.text != username || passwordTF.text != password {
            showHint(with: "Invalid login or password",
                     and: "Please, enter correct login or password")
            passwordTF.text = nil
            return
        }
        
        performSegue(withIdentifier: "login", sender: self)
    }
    
    @IBAction func hintPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            showHint(with: "Ooops!", and: "Your name is \(username) 🤓")
        } else {
            showHint(with: "Ooops!", and: "Your password is \(password) 😳")
        }
    }
        
    private func showHint(with title: String, and message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertController, animated: true)
    }
}
