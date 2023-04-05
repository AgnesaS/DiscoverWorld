//
//  UIViewControllers+Alerts.swift
//  App
//
//  Created by FatjonaHoti  on 14.3.23.
//

import UIKit
extension UIViewController {
    
    func showAlertWith(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: nil))
        self.present(alert, animated: true)
    }
}
extension String{
    func localizableString() -> String {
        return NSLocalizedString(self, comment: "")
    }
} 
