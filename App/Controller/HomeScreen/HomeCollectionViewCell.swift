//
//  HomeCollectionViewCell.swift
//  App
//
//  Created by Agnesa  on 12.3.23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var myModel = [HomeModel]()
    
    static let identifier = String(describing: HomeCollectionViewCell.self)
    //MARK: Functions
    func setup(_ place: HomeModel){
        placeImage.image = place.image
        nameLabel.text = place.title
        
    }
}
