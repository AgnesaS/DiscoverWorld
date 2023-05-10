//
//  TabBarViewController.swift
//  App
//
//  Created by Agnesa  on 5.4.23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}
