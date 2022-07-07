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
    
    private let user = User.getUser()
    private var person: Person?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.person = person
            } else if let siteVC = viewController as? SiteViewController {
                siteVC.person = person
            } else if let navigationVC = viewController as? UINavigationController {
                guard let personVC = navigationVC.topViewController as? PersonViewController else { return }
                personVC.person = person
            }
        }
    }

    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        usernameTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func loginPressed() {
        guard usernameTF.text == user.username, passwordTF.text == user.password else {
            showHint(with: "Invalid login or password",
                     and: "Please, enter correct username or password")
            return
        }
        
        person = user.person
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    @IBAction func hintPressed(_ sender: UIButton) {
        sender.tag == 0
            ? showHint(with: "Oops!", and: "Your name is \(user.username) 😉")
            : showHint(with: "Oops!", and: "Your password is \(user.password) 😉")
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
