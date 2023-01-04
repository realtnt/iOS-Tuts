//
//  WeatherViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!

    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    var conditionName: String = ""
    var cityName: String = ""
    var temperatureString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()

        searchTextField.delegate = self
    }

    func updateUI() {
        DispatchQueue.main.sync {
            conditionImageView.image = UIImage(systemName: conditionName)
            cityLabel.text = cityName
            temperatureLabel.text = temperatureString
        }
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something!"
            return false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            weatherManager.fetchWeather(cityName: city)
        }
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func weatherDidUpdate(_ weatherManager: WeatherManager, weather: WeatherModel) {
        conditionName = weather.conditionName
        cityName = weather.cityName
        temperatureString = weather.temperatureString
        updateUI()
    }

    func didFailWithError(_ weatherManager: WeatherManager, error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    @IBAction func currentLocationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(lat: lat, lon: lon)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LocationManager didFailWithError \(error.localizedDescription)")
    }
}
