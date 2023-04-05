//
//  DetailsViewController.swift
//  App
//
//  Created by Agnesa  on 13.3.23.
//

import UIKit

class DetailsViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var item: HomeModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        imageView.image = item?.image
        titleLabel.text = item?.title
    }
    //MARK: IBActions
    @IBAction func backToHome(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
