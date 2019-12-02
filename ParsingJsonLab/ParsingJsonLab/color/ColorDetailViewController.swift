//
//  ColorDetailViewController.swift
//  ParsingJsonLab
//
//  Created by Tanya Burke on 12/1/19.
//  Copyright © 2019 Tanya Burke. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

      @IBOutlet weak var hexLabel: UILabel!
        @IBOutlet weak var redLabel: UILabel!
        @IBOutlet weak var greenLabel: UILabel!
        @IBOutlet weak var blueLabel: UILabel!
        @IBOutlet weak var colorView: UIView!
        
        var color: Color?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()

        }

        
        func updateUI() {
            guard let theColor = color else {
                 fatalError("theColor is nil, verify prepare for segue")
            }
            
            navigationItem.title = theColor.name.value
            redLabel.text? = "RED: \(String(format: "%.2f", theColor.rgb.fraction.r))"
            greenLabel.text = "GREEN: \(String(format: "%.2f", theColor.rgb.fraction.g))"
            blueLabel.text = "BLUE: \(String(format: "%.2f", theColor.rgb.fraction.b))"
            hexLabel.text = "HEX: \(theColor.hex.value)"
            colorView.backgroundColor = UIColor(displayP3Red: CGFloat(theColor.rgb.fraction.r), green: CGFloat(theColor.rgb.fraction.g) , blue: CGFloat(theColor.rgb.fraction.b), alpha: 0.7)
            
            
            colorView.layer.borderColor = UIColor.white.cgColor
            colorView.layer.borderWidth = 10.0
        }
    }
