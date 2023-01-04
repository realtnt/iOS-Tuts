//
//  WeatherManager.swift
//  Clima
//
//  Created by Ntogiakos, Theodoros on 03/01/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=fb70fcaca2b80fcef5d5ca5c589a32d0&units=metric"
    var weatherIcon = ""

    var delegate: WeatherManagerDelegate?

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }

    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(with: urlString)
    }

    func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                delegate?.didFailWithError(self, error: error!)
                return
            }
            if let safeData = data {
                if let weather = self.parseJSON(safeData) {
                    delegate?.weatherDidUpdate(self, weather: weather)
                }
            }
        }
        task.resume()
    }

    func parseJSON(_ data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(self, error: error)
        }
        return nil
    }
}

protocol WeatherManagerDelegate {
    func weatherDidUpdate(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(_ weatherManager: WeatherManager, error: Error)
}
