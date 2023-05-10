//
//  DetailsViewController.swift
//  App
//
//  Created by Agnesa  on 13.3.23.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var item: CityModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.kf.setImage(with: URL(string: item?.image ?? ""))
        titleLabel.text = item?.title
        descriptionLabel.text = item?.cityDescription
        categoryLabel.text = item?.category
    }
}
