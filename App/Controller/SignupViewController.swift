//
//  SignupViewController.swift
//  App
//
//  Created by FatjonaHoti  on 11.3.23.
//

import UIKit

class SignupViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    //MARK: Functions
    func validateFields(){
        guard let firstName = firstNameTextField.text, !firstName.isEmpty else{
            self.firstNameTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your First Name".localizableString())
            return
        }
        guard let lastName = lastNameTextField.text, !lastName.isEmpty else {
            self.lastNameTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your Last Name".localizableString())
            return
        }
        guard let email = emailTextField.text, !email.isEmpty else {
            self.emailTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your email address".localizableString())
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            self.passwordTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your password".localizableString())
            return
        }
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    //MARK: IBActions
    @IBAction func singupButtonTapped(_ sender: Any) {
        validateFields()
        if isValidEmail(emailTextField.text ?? ""){
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            let user = UserModel(name: "New", username: "Member")
            storyboard.user = user
            self.navigationController?.pushViewController(storyboard, animated: true)
        }else {
            self.showAlertWith(title: "Discover World", message: "Please enter a valid email address".localizableString())
        }
    }
    @IBAction func backToLogin(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
}
