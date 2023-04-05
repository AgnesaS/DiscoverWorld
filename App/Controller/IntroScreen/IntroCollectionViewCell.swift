//
//  IntroCollectionViewCell.swift
//  App
//
//  Created by Agnesa  on 10.3.23.
//

import UIKit

class IntroCollectionViewCell: UICollectionViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    static let identifier = String(describing: IntroCollectionViewCell.self)
    //MARK: Functions
    func setup(_ slide: IntroScreenModel){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
