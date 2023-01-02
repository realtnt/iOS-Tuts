//
//  BMI.swift
//  BMI Calculator
//
//  Created by Ntogiakos, Theodoros on 02/01/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    let value: Float
    let advice: String
    let color: UIColor

    func getBmi() -> String {
        return String(format: "%.1f", value)
    }

    func getAdvice() -> String {
        return advice
    }

    func getColor() -> UIColor {
        return color
    }
}
