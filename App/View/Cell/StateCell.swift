//
//  CityCell.swift
//  App
//
//  Created by Agnesa  on 5.4.23.
//

import UIKit

class StateCell: UICollectionViewCell {
    //MARK: IBOutles
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stateTitleLabel: UILabel!
    var isSelectable: Bool = true
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTopCorners()
        // Initialization code
    }
    override var isSelected: Bool{
        didSet{
            if isSelectable{
                if isSelected{
                    selectCell()
                }else{
                    deselectCell()
                }
            }
        }
    }
    //MARK: IBActions
    func selectCell(){
        self.containerView.backgroundColor = .gray
        self.stateTitleLabel.textColor = .white
    }
    func deselectCell(){
        self.containerView.backgroundColor = .white
        self.stateTitleLabel.textColor = .black
    }
    func setupTopCorners(){
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 20
    }
    func setupStates(_ state: StateModel){
        stateTitleLabel.text = state.title
    }
}
