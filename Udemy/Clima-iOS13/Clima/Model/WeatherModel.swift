//
//  WeatherModel.swift
//  Clima
//
//  Created by Ntogiakos, Theodoros on 04/01/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    var conditionName: String {
        switch conditionId {
        case 200..<300:
            return "cloud.bolt"
        case 300..<400:
            return "cloud.drizzle"
        case 500...504:
            return "cloud.rain"
        case 511:
            return "cloud.snow"
        case 520..<600:
            return "cloud.drizzle"
        case 600..<700:
            return "cloud.snow"
        case 701:
            return "cloud.fog"
        case 721:
            return "sun.haze"
        case 741:
            return "cloud.fog"
        case 781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801:
            return "cloud.sun"
        case 802..<900:
            return "cloud"
        default:
            return "cloud"
        }
    }
}
