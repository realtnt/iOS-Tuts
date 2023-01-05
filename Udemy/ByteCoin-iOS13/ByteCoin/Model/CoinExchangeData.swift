//
//  CoinExchangeModel.swift
//  ByteCoin
//
//  Created by Ntogiakos, Theodoros on 04/01/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinExchangeData: Decodable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
