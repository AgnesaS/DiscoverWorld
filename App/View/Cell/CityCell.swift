//
//  StateCell.swift
//  App
//
//  Created by Agnesa  on 5.4.23.
//

import UIKit
import Kingfisher

class CityCell: UICollectionViewCell {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCities(_ city:CityModel ){
        cityImageView.kf.setImage(with: URL(string: city.image ?? ""))
        titleLabel.text = "\(city.title ?? "") "
//        emailLabel.text = user.email ?? ""
    }

}
