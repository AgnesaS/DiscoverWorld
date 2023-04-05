//
//  CityCell.swift
//  App
//
//  Created by Agnesa  on 5.4.23.
//

import UIKit

class StateCell: UICollectionViewCell {
    @IBOutlet weak var stateTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupStates(_ state: StateModel){
        stateTitleLabel.text = state.title
    }

}
