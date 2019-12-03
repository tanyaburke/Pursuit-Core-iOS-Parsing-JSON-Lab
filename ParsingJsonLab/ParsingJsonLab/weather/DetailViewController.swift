//
//  DetailViewController.swift
//  ParsingJsonLab
//
//  Created by Tanya Burke on 11/30/19.
//  Copyright © 2019 Tanya Burke. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

      
    @IBOutlet weak var tempLabel: UILabel!
            @IBOutlet weak var desctiptionLabel: UILabel!
    
    
    var city: CitiesWeather!

    override func viewDidLoad() {
        super.viewDidLoad()
    
  
        
            
            func updateUI() {
                guard let theCity = city else {
                    fatalError("theCity is nil, verify prepare for segue")
                }
                
                navigationItem.title = theCity.name
                tempLabel.text? = "\(theCity.main.)C ˚"
                desctiptionLabel.text? = theCity.weather.first?.description.capitalized ?? "ny"

            }

        }
}
