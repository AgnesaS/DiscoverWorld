//
//  UserRequests.swift
//  App
//
//  Created by Agnesa  on 27.4.23.
//

import Foundation
import Alamofire
import SwiftyJSON

class CityRequest: NSObject{
    static func getCity(id: Int, completionHandler: @escaping(_ city: CityModel?, _ error: Error?) -> Void) {
        let urlString = "https://fakestoreapi.com/products/\(id)"
        
        AF.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
            case .success(let data):
                let dataJSON = JSON(data)
                if let city = CityModel.createCity(json: dataJSON) {
                    completionHandler(city, nil)
                }
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    static func getCities(completionHandler: @escaping(_ cities: [CityModel], _ error: Error?) -> Void) {
        let urlString = "https://fakestoreapi.com/products"
        
        AF.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
            case .success(let data):
                let dataJSON = JSON(data)
                if let dataArray = dataJSON.array {
                    let cities = CityModel.createCities(jsonArray: dataArray)
                    completionHandler(cities, nil)
                }
            case .failure(let error):
                completionHandler([], error)
            }
        }
    }
}
