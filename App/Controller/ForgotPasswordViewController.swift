//
//  ForgotPasswordViewController.swift
//  App
//
//  Created by FatjonaHoti  on 11.3.23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var repeatNewPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    //MARK: Functions
    func validateFields(){
        guard let email = emailTextField.text, !email.isEmpty else {
            self.emailTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your email".localizableString())
            return
        }
        guard let newPassword = newPasswordTextField.text, !newPassword.isEmpty else {
            self.newPasswordTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the  World", message: "Please enter your old password".localizableString())
            return
    }
        guard let repeatNewPassword = repeatNewPasswordTextField.text, !repeatNewPassword.isEmpty else {
            self.repeatNewPasswordTextField.becomeFirstResponder()
            self.showAlertWith(title: "Discover the World", message: "Please enter your new password".localizableString())
            return
    }
        guard (newPassword == repeatNewPassword) else {
            self.showAlertWith(title: "Discover the World", message: "Passwords doesn't match".localizableString())
            return
        }
    }
    //MARK: IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        validateFields()
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
}
