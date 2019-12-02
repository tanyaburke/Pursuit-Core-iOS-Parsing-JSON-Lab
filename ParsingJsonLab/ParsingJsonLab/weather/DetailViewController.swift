//
//  DetailViewController.swift
//  ParsingJsonLab
//
//  Created by Tanya Burke on 11/30/19.
//  Copyright © 2019 Tanya Burke. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    
            @IBOutlet weak var tempLabel: UILabel!
            @IBOutlet weak var desctiptionLabel: UILabel!
            @IBOutlet weak var minTemp: UILabel!
            @IBOutlet weak var maxTemp: UILabel!
            
            var city: City?
            
            override func viewDidLoad() {
                super.viewDidLoad()
                updateUI()

                // Do any additional setup after loading the view.
            }
            
            func updateUI() {
                guard let theCity = city else {
                    fatalError("theCity is nil, verify prepare for segue")
                }
                
                navigationItem.title = theCity.name
                tempLabel.text? = "\(theCity.main.temp)C ˚"
                desctiptionLabel.text? = theCity.weather.first?.description.capitalized ?? "xyc"
                minTemp.text = "Min Temp: \(theCity.main.temp_min)C ˚"
                maxTemp.text = "Max Temp: \(theCity.main.temp_max)C ˚"
            }

        }
