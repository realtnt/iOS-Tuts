//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = ProcessInfo.processInfo.environment["COINAPI_SECRET"]
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        guard let apiKey = apiKey else { return }
        let urlString = baseURL + "/\(currency)?apikey=\(apiKey)"
        performRequest(for: urlString)
    }

    func performRequest(for urlString: String) {
        guard let url = URL(string: urlString) else { return }

        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) { (data, urlResponse, error) in
            if error != nil {
                delegate?.didFailWithError(self, error: error!)
                return
            }
            guard let safeData = data else { return }
            if let coinData = parseJSON(safeData) {
                delegate?.didUpdateCoinSelection(self, coinModel: coinData)
            }
        }
        task.resume()
    }

    func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinExchangeData.self, from: data)
            let rate = decodedData.rate
            let time = decodedData.time
            let quote = decodedData.asset_id_quote
            let coinExchange = CoinModel(rate: rate, time: time, quote: quote)
            return coinExchange
        } catch {
            delegate?.didFailWithError(self, error: error)
        }
        return nil
    }
}

protocol CoinManagerDelegate {
    func didUpdateCoinSelection(_ coinManager: CoinManager, coinModel: CoinModel)
    func didFailWithError(_ coinManager: CoinManager, error: Error)
}
