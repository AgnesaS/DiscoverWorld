//
//  ViewController.swift
//  App
//
//  Created by Agnesa  on 09.3.23.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.logoImage.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
           
            self.performSegue(withIdentifier: "OpenIntroScreen", sender: nil)
        }
    }
    func checkIfFirstTime(){
        
    }
}

