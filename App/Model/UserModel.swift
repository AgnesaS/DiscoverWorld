//
//  UserModel.swift
//  App
//
//  Created by Agnesa  on 13.3.23.
//

import Foundation
import UIKit
import SwiftyJSON

struct Images: Codable{
    let total: Int
    let total_pages: Int
    let results: [Result]
}
struct Result: Codable{
    let id: String
    let urls: URLS
}
struct URLS: Codable{
    let regular: String
}
struct IntroScreenModel {
    let title: String
    let description: String
    let image: UIImage
}
struct StateModel{
    let title: String
}
struct CityModel {
    var id: Int?
    var title: String?
    var cityDescription: String?
    var category: String?
    var image: String?
    var isFavorite: Bool = false
    var isRated: Bool = false
    var rateValue: Int = 0
    
    static func createCity(json: JSON) -> CityModel? {
        var city = CityModel()
        
        if let id = json["id"].int {
            city.id = id
        }
        if let title = json["title"].string {
            city.title = title
        }
        if let productDescription = json["description"].string {
            city.cityDescription = productDescription
        }
        if let category = json["category"].string{
            city.category = category
        }
        if let image = json["image"].string{
            city.image = image
        }
        return city
    }
    static func createCities(jsonArray: [JSON]) -> [CityModel] {
        var citiesArray: [CityModel] = []
        for jsonObject in jsonArray {
            if let city = createCity(json: jsonObject) {
                citiesArray.append(city)
            }
        }
        return citiesArray
    }
}




