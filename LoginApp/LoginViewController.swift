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
    
    private let username = "Debash"
    private let password = "1234"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        //usernameTF.resignFirstResponder()
        //passwordTF.resignFirstResponder()
        view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.username = usernameTF.text
    }

    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
//        guard let loginVC = unwindSegue.destination as? LoginViewController else { return }
//        loginVC.usernameTF.text = nil
//        loginVC.passwordTF.text = nil
        usernameTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func loginPressed() {
        if usernameTF.text != username || passwordTF.text != password {
            showHint(
                with: "Invalid login or password",
                and: "Please, enter correct login or password",
                textField: passwordTF
            )
            return
        }
        
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func hintPressed(_ sender: UIButton) {
        sender.tag == 0
            ? showHint(with: "Ooops!", and: "Your name is \(username) 🤓")
            : showHint(with: "Ooops!", and: "Your password is \(password) 😳")
    }
        
    private func showHint(with title: String, and message: String, textField: UITextField? = nil) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
