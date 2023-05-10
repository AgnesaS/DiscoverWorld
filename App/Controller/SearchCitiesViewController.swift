//
//  ViewController.swift
//  Unsplash
//
//  Created by Agnesa  on 10.5.23.
//

import UIKit

class SearchCitiesViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate {
    
  
    private var collectionView: UICollectionView?
    
    var results: [Result] = []
    
    let searchbar = UISearchBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        view.addSubview(searchbar)
        collectionView.backgroundColor = .systemBackground
        self.collectionView = collectionView
        
       
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setFrames()
    }
    func setFrames(){
        searchbar.frame = CGRect(x: 10, y: Int(view.safeAreaInsets.top), width: Int(view.frame.size.width)-20, height: 50)
        collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+55, width: view.frame.size.width, height: view.frame.size.height-55)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text{
            results = []
            collectionView?.reloadData()
            fetchData(query: text)
        }
    }
    func fetchData(query: String){
        let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(query)&client_id=ioV_jgmX2IywuM8YUgQ56QmXdcPyHLbp_zBt7ztmtKA"
        
        guard let url = URL(string: urlString) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonResults = try JSONDecoder().decode(Images.self, from: data)
                DispatchQueue.main.async {
                    self?.results = jsonResults.results
                    self?.collectionView?.reloadData()
                }
          
            }catch{
                print(error)
            }
            print("got data")
        }
        task.resume()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results[indexPath.row].urls.regular
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: imageURLString)
         return cell
    }
}

