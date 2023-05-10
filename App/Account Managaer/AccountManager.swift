//
//  AccountManager.swift
//  App
//
//  Created by Agnesa  on 4.5.23.
//

import Foundation
import UIKit

protocol AccountProtocol: class{
    func userLogout()
}
class Account: NSObject{
    static let shared = Account()
    weak var delegate: AccountProtocol?
    
    func clear(){
        delegate?.userLogout()
    }
}
