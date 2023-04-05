//
//  HomeViewController.swift
//  App
//
//  Created by Agnesa  on 12.3.23.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var places: [HomeModel] = []
    var user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  self.navigationItem.setHidesBackButton(true, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        firstLabel.text = user?.name
        secondLabel.text = user?.username
        places = [HomeModel(title: "USA", image: UIImage(named: "usa")!),
                  HomeModel(title: "South Africa", image: UIImage(named: "southafrica")!),
                  HomeModel(title: "Spain", image: UIImage(named: "spain")!),
                  HomeModel(title: "Canada", image: UIImage(named: "canada")!),
                  HomeModel(title: "England", image: UIImage(named: "england")!),
                  HomeModel(title: "Belgium", image: UIImage(named:"belgium")!),
                  HomeModel(title: "Indonesia", image: UIImage(named: "indonesiaa")!),
                  HomeModel(title: "Arabs Emirates", image: UIImage(named: "unitedarabemirates")!),
                  HomeModel(title: "Turkey", image: UIImage(named: "turkey")!),
                  HomeModel(title: "France", image: UIImage(named: "france")!)
        ]
    }
}
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 20
        cell.setup(places[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width - 20) / 2
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let selectedItem = places[indexPath.row]
        storyboard.item = selectedItem
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
}


