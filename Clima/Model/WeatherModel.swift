//
//  WeatherModel.swift
//  Clima
//
//  Created by Tony Alhwayek on 1/29/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit

struct WeatherModel {
    let temperature: Double
    let conditionId: Int
    let cityName: String
    
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        default:
            return "sun.max"
        }
    }
}
