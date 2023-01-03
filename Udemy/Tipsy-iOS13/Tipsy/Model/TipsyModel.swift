//
//  TipsyModel.swift
//  Tipsy
//
//  Created by Ntogiakos, Theodoros on 03/01/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyModel {
    var tipPercentage = 10.0 {
        didSet {
            calculateAmount()
        }
    }
    var splitBy = 2 {
        didSet {
            calculateAmount()
        }
    }
    var billtotal = 0.0 {
        didSet {
            calculateAmount()
        }
    }
    var amountPerPerson = 0.0

    mutating func calculateAmount() {
        amountPerPerson = (billtotal + billtotal * (tipPercentage/100)) / Double(splitBy)
    }
}
