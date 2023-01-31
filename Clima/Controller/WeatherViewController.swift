//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        weatherManager.delegate = self
        
        // Gives functionality to the 'return' button
        searchTextField.delegate = self
    }
    
    // When search button (top right one) is pressed
    @IBAction func searchPressed(_ sender: UIButton) {
        // Hide keyboard on search pressed
        searchTextField.endEditing(true)
        
        //print(searchTextField.text!)
    }
    

    // Allows the "search" button on the keyboard to trigger this functionality
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide keyboard on search pressed
        searchTextField.endEditing(true)
        
        return true
    }
    
    // Change placeholder to alert user that they haven't entered anything into the text field
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    // Clear search bar when search is pressed
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Capture user entered data
        
        if let city = searchTextField.text {
            // Replace spaces with plus signs
            // This allows for cities with two or more words to be searched for
            let replaced = city.replacingOccurrences(of: " ", with: "+")
            weatherManager.fetchWeather(cityName: replaced)
        }
        
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

