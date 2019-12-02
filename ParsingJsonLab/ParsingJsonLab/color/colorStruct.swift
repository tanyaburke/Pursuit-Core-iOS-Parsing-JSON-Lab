//
//  colorStruct.swift
//  ParsingJsonLab
//
//  Created by Tanya Burke on 12/1/19.
//  Copyright © 2019 Tanya Burke. All rights reserved.
//

import Foundation

struct ColorData: Codable {
    let colors: [Color]
    
}

struct Color: Codable  {
    let rgb: RgbInfo
    let name: NameInfo
    let hex: HexInfo
    
}

struct HexInfo: Codable  {
    let value: String
}

struct RgbInfo: Codable {
    let fraction: FractionInfo
}

struct FractionInfo: Codable {
    let r: Double
    let g: Double
    let b: Double
}

struct NameInfo: Codable {
    let value: String
}


extension ColorData {
    static func getColors() -> [Color] {
        var colors = [Color]()
        
        guard let fileURL = Bundle.main.url(forResource: "color", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let colorData = try JSONDecoder().decode(ColorData.self, from: data)
            colors = colorData.colors
        } catch {
               fatalError("failed to load from contents \(error)")
           }
        return colors
        
    }
}
