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
    
    private let users = User.getUsers()
    private var openPerson: Person? = nil
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.username = openPerson?.name
                welcomeVC.image = openPerson?.image
            } else if let siteVC = viewController as? SiteViewController {
                siteVC.site = openPerson?.site
            } else if let navigationVC = viewController as? UINavigationController {
                guard let personVC = navigationVC.topViewController as? PersonViewController else { return }
                personVC.name = openPerson?.name
                personVC.image = openPerson?.image
                personVC.about = openPerson?.about
            }
        }
    }

    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        usernameTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func loginPressed() {
        let errorTitle = "Invalid login or password"
        let errorMessage = "Please, enter correct username or password"
        
        guard let username = usernameTF.text else {
            showHint(with: errorTitle, and: "Please, enter username!")
            return
        }
        
        guard let user = User.getUserFrom(username: username), passwordTF.text == user.password else {
            showHint(with: errorTitle, and: errorMessage)
            return
        }
        
        if let person = Person.getPersonFrom(username: username) {
            openPerson = person
            performSegue(withIdentifier: "login", sender: nil)
        }
    }
    
    @IBAction func hintPressed(_ sender: UIButton) {
        var text = ""
        
        if sender.tag == 0 {
            text = "You can use this names: \n"
            for user in users {
                text += "\(user.username)\n"
            }
        } else {
            for user in users {
                text += "Password for \(user.username) is \(user.password) \n"
            }
        }

        showHint(with: "Ooops!", and: "\(text) 😳")
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
