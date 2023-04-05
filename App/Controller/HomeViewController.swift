//
//  HomeViewController.swift
//  App
//
//  Created by Agnesa  on 12.3.23.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: IBOutlets
    
    @IBOutlet weak var statesCollectionView: UICollectionView!
    @IBOutlet weak var citiesCollectionView: UICollectionView!
    
    var statesArray: [StateModel] = []
    var citiesArray: [CityModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupCollectionView()
        setupStates()
        setupCities()
    }
    func setupStates(){
        statesArray = [StateModel(title: "USA"), StateModel(title: "Kosovo"),StateModel(title: "USA"), StateModel(title: "Kosovo"),StateModel(title: "USA"), StateModel(title: "Kosovo"),StateModel(title: "USA"), StateModel(title: "Kosovo"),StateModel(title: "Kosovo"),StateModel(title: "USA"), StateModel(title: "Kosovo")]
        statesCollectionView.reloadData()
    }
    func setupCities(){
        citiesArray = [CityModel(title: "USA", description: "USA is the best place", image: UIImage(named: "1")!),
                       CityModel(title: "USA", description: "USA is the best place", image: UIImage(named: "1")!),
                       CityModel(title: "USA", description: "USA is the best place", image: UIImage(named: "1")!),
                       CityModel(title: "USA", description: "USA is the best place", image: UIImage(named: "1")!),
                       CityModel(title: "USA", description: "USA is the best place", image: UIImage(named: "1")!)]
        citiesCollectionView.reloadData()
    }
}

//MARK: CollectionView
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func setupCollectionView(){
        statesCollectionView.dataSource = self
        statesCollectionView.delegate = self
        statesCollectionView.register(UINib(nibName: "StateCell", bundle: nil), forCellWithReuseIdentifier: "StateCell")
        
        citiesCollectionView.dataSource = self
        citiesCollectionView.delegate = self
        citiesCollectionView.register(UINib(nibName: "CityCell", bundle: nil), forCellWithReuseIdentifier: "CityCell")
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == statesCollectionView{
            return statesArray.count
        }else{
            return citiesArray.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == statesCollectionView{
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "StateCell", for: indexPath) as! StateCell
            cell1.setupStates(statesArray[indexPath.item])
            return cell1
        }else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as! CityCell
            cell2.layer.borderWidth = 0.3
            cell2.layer.borderColor = UIColor.gray.cgColor
            cell2.layer.cornerRadius = 20
            cell2.setupCities(citiesArray[indexPath.item])
            return cell2
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == statesCollectionView {
            return CGSize(width: 70, height: 100)
        }
        else {
            return CGSize(width: self.view.frame.width , height: self.view.frame.width )
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == citiesCollectionView {
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            let selectedItem = citiesArray[indexPath.row]
            storyboard.item = selectedItem
            self.navigationController?.pushViewController(storyboard, animated: true)
        }
    }
    
}
