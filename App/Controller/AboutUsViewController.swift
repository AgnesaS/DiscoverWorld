//
//  AboutUsViewController.swift
//  App
//
//  Created by Agnesa  on 4.5.23.
//

import UIKit

class AboutUsViewController: UIViewController {
    //MARK: IBOutles
    @IBOutlet weak var verticalScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }
    //MARK: Functions
    func setupScrollView(){
        let scrollView = UIScrollView(frame: self.view.bounds)
        let textLabel = UILabel(frame: CGRect(x: 30, y: 20, width: 300, height: 300))
        textLabel.text = "Discover the World is an iOS app designed to help users explore and learn about different parts of the world. The app features an intuitive interface and a variety of tools to help users plan their trips, learn about different destinations, and discover new places and experiences. Upon opening the app, users are greeted with a home screen that provides a quick overview of their saved destinations, as well as popular destinations from around the world. From here, users can navigate to different sections of the app, including a 'Discover' section that allows them to explore destinations by region or interest, and a 'Plan' section that provides tools for planning their trips.In the 'Discover' section, users can browse different destinations by region or interest, such as 'Europe', 'Asia', 'Beaches', or 'Adventure.' Each destination is accompanied by a brief description and photos, as well as user ratings and reviews. Users can also filter destinations based on factors such as budget, duration, and activities.Discover the World is an iOS app designed to help users explore and learn about different parts of the world. The app features an intuitive interface and a variety of tools to help users plan their trips, learn about different destinations, and discover new places and experiences. Upon opening the app, users are greeted with a home screen that provides a quick overview of their saved destinations, as well as popular destinations from around the world. From here, users can navigate to different sections of the app, including a 'Discover' section that allows them to explore destinations by region or interest, and a 'Plan' section that provides tools for planning their trips.In the 'Discover' section, users can browse different destinations by region or interest, such as 'Europe', 'Asia', 'Beaches', or 'Adventure.' Each destination is accompanied by a brief description and photos, as well as user ratings and reviews. Users can also filter destinations based on factors such as budget, duration, and activities.Discover the World is an iOS app designed to help users explore and learn about different parts of the world. The app features an intuitive interface and a variety of tools to help users plan their trips, learn about different destinations, and discover new places and experiences. Upon opening the app, users are greeted with a home screen that provides a quick overview of their saved destinations, as well as popular destinations from around the world. From here, users can navigate to different sections of the app, including a 'Discover' section that allows them to explore destinations by region or interest, and a 'Plan' section that provides tools for planning their trips.In the 'Discover' section, users can browse different destinations by region or interest, such as 'Europe', 'Asia', 'Beaches', or 'Adventure.' Each destination is accompanied by a brief description and photos, as well as user ratings and reviews. Users can also filter destinations based on factors such as budget, duration, and activities."
        textLabel.numberOfLines = 0
        textLabel.sizeToFit()
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: textLabel.frame.maxX + 20, height: textLabel.frame.maxY + 20))
        contentView.addSubview(textLabel)
        scrollView.contentSize = contentView.frame.size
        scrollView.addSubview(contentView)
        self.view.addSubview(scrollView)
    }
}
