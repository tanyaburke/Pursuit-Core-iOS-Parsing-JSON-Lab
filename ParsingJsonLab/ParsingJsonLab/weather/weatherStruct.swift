//
//  weatherStruct.swift
//  ParsingJsonLab
//
//  Created by Tanya Burke on 11/30/19.
//  Copyright © 2019 Tanya Burke. All rights reserved.
//

import Foundation

struct CitiesWeather: Codable {
    var name: String
    var main: [Temperature]
    var weather: [Weather]
}

struct Temperature: Codable {
    var temp: Double
    
}
struct Weather: Codable {
    var description: String
}
struct CityList: Codable {
   var list: [CitiesWeather]
}


extension CityList {
    static func getCities() -> [CitiesWeather] {
        var cities = [CitiesWeather]()
        
        guard let fileURL = Bundle.main.url(forResource: "weather", withExtension: "json") else {
            fatalError("could not locate json file")
        }

           do {
               let data = try Data(contentsOf: fileURL)
              
               let cityList = try JSONDecoder().decode(CityList.self, from: data)
               cities = cityList.list
           } catch {
               fatalError("failed to load from contents \(error)")
           }
        
        return cities
    }
}
