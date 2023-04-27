//
//  LoginViewController.swift
//  App
//
//  Created by FatjonaHoti  on 10.3.23.
//

import UIKit


class LoginViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: true)
//        super.viewDidLoad()
        emailTextField.text = "agnesasel@gmail.com"
        passwordTextField.text = "12345"
        
    }
    
    //MARK: Functions
    func validateFields(){
        guard let email = emailTextField.text, !email.isEmpty else {
            self.emailTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your email".localizableString())
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
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        validateFields()
//        if segue.identifier == "goToHome"{
//            if isValidEmail(emailTextField.text ?? "") {
//                    let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//
//                    self.navigationController?.pushViewController(storyboard, animated: true)
//
//                }
//        }else{
//            self.showAlertWith(title: "Discover Europe", message: "Please enter a valid email address".localizableString())
//        }
//    }
    //MARK: IBActions
    @IBAction func loginButtonTapped(_ sender: Any) {
        validateFields()
        if isValidEmail(emailTextField.text ?? "") {
                let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController

                self.navigationController?.pushViewController(storyboard, animated: true)

            }
        else{
            self.showAlertWith(title: "Discover Europe", message: "Please enter a valid email address".localizableString())
        }
    }
        
    @IBAction func signupButtonTapped(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(identifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
}
