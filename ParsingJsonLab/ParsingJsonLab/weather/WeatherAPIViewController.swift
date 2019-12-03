//
//  WeatherAPIViewController.swift
//  ParsingJsonLab
//
//  Created by Tanya Burke on 11/30/19.
//  Copyright © 2019 Tanya Burke. All rights reserved.
//

import UIKit

class WeatherAPIViewController: UIViewController {

     @IBOutlet weak var tableView: UITableView!
        
        var cities = [CitiesWeather]() {
            didSet {
                tableView.reloadData()
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.dataSource = self
            loadData()
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
                             fatalError("failed to get indexPath and detailVC")
                         }
                   
                   detailVC.city = cities[indexPath.row]
        }

        func loadData() {
            cities = getCities()
        }


    }

    extension WeatherAPIViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            cities.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            
            let city = cities[indexPath.row]
            
            cell.textLabel?.text = city.name
            cell.detailTextLabel?.text = "\(city.main.temp) C˚"
            return cell
        }
        
        
    }
