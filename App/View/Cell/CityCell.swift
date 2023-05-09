//
//  StateCell.swift
//  App
//
//  Created by Agnesa  on 5.4.23.
//

import UIKit
import Kingfisher

protocol CityDelegate{
    func addToFavorite(city: CityModel)
    func rateCity(city: CityModel)
}

class CityCell: UICollectionViewCell {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var rateCityButton: UIButton!
    @IBOutlet weak var addToFavoriteButton: UIButton!
    
    var delegate: CityDelegate?
    var city: CityModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCities(_ city:CityModel ){
        self.city = city
        cityImageView.kf.setImage(with: URL(string: city.image ?? ""))
        titleLabel.text = city.title ?? ""
        descriptionLabel.text = city.category ?? ""
//        emailLabel.text = user.email ?? ""
        
        addToFavoriteButton.setImage(UIImage(systemName: city.isFavorite ? "bookmark.fill" : "bookmark"), for: .normal)
        rateCityButton.setImage(UIImage(systemName: city.isRated ? "star.fill" : "star"), for: .normal)
        rateCityButton.setTitle(city.isRated ? "\(city.rateValue)" : "", for: .normal)
        rateCityButton.isUserInteractionEnabled = city.isRated ? false : true
    }

    @IBAction func addToFavoriteButtonPressed(_ sender: Any) {
        if let city = city{
            print("Button tapped")
            delegate?.addToFavorite(city: city)
        }
    }
    @IBAction func rateCityButtonPressed(_ sender: Any) {
        if let city = city{
            delegate?.rateCity(city: city)
        }
    }
}
