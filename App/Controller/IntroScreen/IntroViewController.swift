//
//  IntroViewController.swift
//  App
//
//  Created by Agnesa  on 10.3.23.
//

import UIKit
class IntroViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [IntroScreenModel] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                getStartedButton.setTitle("Get Started", for: .normal)
            } else {
                getStartedButton.setTitle("Next", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.navigationItem.setHidesBackButton(true, animated:true)
        
        slides = [
            IntroScreenModel(title: "Explore the world", description: "Enjoy the holiday! Don't forget to take a picture.", image: UIImage(named: "belgium")!),
            IntroScreenModel(title: "Select your destiny", description: "Choose your destination, plan your tour. Select the fabulous place for your holiday.", image: UIImage(named: "usa")!),
            IntroScreenModel(title: "Schedule your trip", description: "Choose the date and get your ticket. We give you the best price.", image: UIImage(named: "spain")!)
        ]
    }
    //MARK: IBActions
    @IBAction func getStartedTapped(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(storyboard, animated: true)
            storyboard.modalPresentationStyle = .fullScreen
            storyboard.modalTransitionStyle = .flipHorizontal
        }else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath,at: .centeredHorizontally, animated: true)
        }
    }
}
extension IntroViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroCollectionViewCell.identifier, for: indexPath) as! IntroCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}

