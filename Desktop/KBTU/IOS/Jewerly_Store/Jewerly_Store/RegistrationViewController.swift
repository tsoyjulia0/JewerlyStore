//
//  RegistrationViewController.swift
//  Jewerly_Store
//
//  Created by Юлия Цой on 02.12.2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var create: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var alertLabel: UILabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        login.addTarget(self, action: #selector(openLoginPage), for: .touchUpInside)
    }
            
    @objc func openLoginPage() {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPage") as! LoginViewController
        
        let navigationController = UINavigationController(rootViewController: loginVC)
        navigationController.modalPresentationStyle = .fullScreen
                    
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func createButtDidTap(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(hideAlert), userInfo: nil, repeats: false)

        if let name = nameTextField.text, !name.isEmpty,
           let phone = phoneTextField.text, !phone.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
                
            let passwordRegex = "^(?=.*[a-z]).{8,}$"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
                
            if passwordPredicate.evaluate(with: password) {
                let registeredUser = User(name: name, phone: phone, password: password)
                storeUser(user: registeredUser)

                alertLabel.text = "Great!"
                
            } else {
                showAlert(message: "Password must include at least 8 characters and 1 digit")
            }
                
        } else {
            showAlert(message: "Please fill in all fields.")
        }
        
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPage") as! LoginViewController
        
        let navigationController = UINavigationController(rootViewController: loginVC)
        navigationController.modalPresentationStyle = .fullScreen
                    
        present(navigationController, animated: true, completion: nil)
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Wrong credentials", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func hideAlert() {
        alertLabel.text = ""
    }
    
    private func storeUser(user: User) {
        UserDefaults.standard.set(user.name, forKey: "registeredUserName")
        UserDefaults.standard.set(user.phone, forKey: "registeredUserPhone")
        UserDefaults.standard.set(user.password, forKey: "registeredUserPassword")
    }
}
