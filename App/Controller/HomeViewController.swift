//
//  HomeViewController.swift
//  App
//
//  Created by Agnesa  on 12.3.23.
//

import UIKit
import ViewAnimator
import CoreData

class HomeViewController: UIViewController {
    //MARK: IBOutlets
    
    @IBOutlet weak var statesCollectionView: UICollectionView!
    @IBOutlet weak var citiesCollectionView: UICollectionView!
    
    var statesArray: [StateModel] = []
    var citiesArray: [CityModel] = []
    var isSelectable = true
  //  var selectedStateIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
      
        setupCollectionView()
        setupStates()
        getCities()
    }
    func setupStates(){
        statesArray = [StateModel(title: "Africa"),StateModel(title: "Europe"),StateModel(title: "Asia"),StateModel(title: "Australia"), StateModel(title: "North America"),StateModel(title: "South America"), StateModel(title: "Antarctica")]
        statesCollectionView.reloadData()
    }
    func getCity(){
        CityRequest.getCity(id: 8) { city, error in
            if let city = city {
                print("user id = \(city.id ?? 0)")
                print("user name = \(city.title ?? "")")
                print("user last name = \(city.cityDescription ?? "")")
                print("user email = \(city.category ?? "")")
            }
            
            if let error = error {
                print("getUser error = \(error)")
            }
        }
    }
    func getCities(){
        CityRequest.getCities { cities, error in
            guard error == nil else { return }
            self.citiesArray = cities
            self.citiesCollectionView.reloadData()
            self.saveCities()
          
        }
    }
    //coredata
    func saveCities(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            if let entity = NSEntityDescription.entity(forEntityName: "CityEntity", in: context){
                
                for city in citiesArray {
                    print("success")
                    let cityEmo = NSManagedObject(entity: entity, insertInto: context)
                    cityEmo.setValue(city.id, forKey: "id")
                    cityEmo.setValue(city.title, forKey: "title")
                    cityEmo.setValue(city.cityDescription, forKey: "cityDescription")
                    cityEmo.setValue(city.image, forKey: "image")
                    cityEmo.setValue(city.isFavorite, forKey: "isFavorite")
                    cityEmo.setValue(city.isRated, forKey: "isRated")
                    cityEmo.setValue(city.rateValue, forKey: "rateValue")
           
                    
                }
            }
            do{
                try context.save()
                getCitiesCoreData()
            }
            catch{
                print("We save some errors\(error)")
            }
        }
       
    }
    func getCitiesCoreData(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let context = appDelegate?.persistentContainer.viewContext{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CityEntity")
            do{
                let results = try context.fetch(request)
                if let resultsArray = results as? [NSManagedObject]{
                    for cityEmo in resultsArray{
//                        print(cityEmo.value(forKey: "id") ?? 0)
//                        print(cityEmo.value(forKey: "title") ?? "")
//                        print("\n")
                    }
                }
            }catch{
                print("Couldn't get employyes")
            }
        }
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
            cell1.layer.borderWidth = 0.3
            cell1.layer.borderColor = UIColor.gray.cgColor
            cell1.layer.cornerRadius = 20
            cell1.setupStates(statesArray[indexPath.item])
            return cell1
        }else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCell", for: indexPath) as! CityCell
       //     cell2.layer.borderWidth = 0.3
           // cell2.layer.borderColor = UIColor.gray.cgColor
           // cell2.layer.cornerRadius = 20
            cell2.setupCities(citiesArray[indexPath.item])
            cell2.delegate = self
            return cell2
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == statesCollectionView {
            return CGSize(width: 120, height: 40)
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
        }else{
            

        }
    }
    
}

extension HomeViewController: CityDelegate{
    func addToFavorite(city: CityModel) {
        for i in 0...citiesArray.count - 1{
            if city.id == citiesArray[i].id{
                citiesArray[i].isFavorite = !citiesArray[i].isFavorite
            }
        }
        citiesCollectionView.reloadData()
    }
    
    func rateCity(city: CityModel) {
        showAlertFor(city: city)
    }
    
    
}

extension HomeViewController{
    func showAlertFor(city: CityModel) {
        let alert = UIAlertController(title: "Rate", message: "How do you rate \(city.title)?", preferredStyle: .alert)
        
        alert.addTextField { rateTextfield in
            rateTextfield.placeholder = "Enter your rate here"
            rateTextfield.keyboardType = .numberPad
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }
        alert.addAction(cancel)
        
        let rate = UIAlertAction(title: "Rate", style: .default) { _ in
            let rateValue = Int(alert.textFields?[0].text ?? "")
        
            //zevendesim per iterim
//            let filteredRecipe = self.recipesArray.filter ({ $0.id == recipe.id }).first
            
            for i in 0...self.citiesArray.count - 1 {
                if city.id == self.citiesArray[i].id {
                    self.citiesArray[i].isRated = true
                    if let rateValue = rateValue {
                        self.citiesArray[i].rateValue = rateValue
                    }
                    self.citiesCollectionView.reloadData()
                }
            }
        }
        
        alert.addAction(rate)
        self.present(alert, animated: true)
    }
}
