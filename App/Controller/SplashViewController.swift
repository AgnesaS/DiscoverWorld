//
//  ViewController.swift
//  App
//
//  Created by Agnesa  on 09.3.23.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
            self.performSegue(withIdentifier: "OpenIntroScreen", sender: nil)
        }
    }
}

