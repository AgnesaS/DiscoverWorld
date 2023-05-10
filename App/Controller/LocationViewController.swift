//
//  LocationViewController.swift
//  App
//
//  Created by Agnesa  on 5.4.23.
//

import UIKit

class LocationViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    //MARK: IBActions
    @IBAction func allowLocationButtonTapped(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "LocationDetailsViewController") as! LocationDetailsViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    @IBAction func maybeLaterButtonTapped(_ sender: Any) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
}
