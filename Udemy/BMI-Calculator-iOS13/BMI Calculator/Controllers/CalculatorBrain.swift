//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ntogiakos, Theodoros on 02/01/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    let adviceList = [
        "get fatter",
        "you're alright",
        "get leaner"
    ]
    var height: Float = 1.5 {
        didSet {
            setBmiValue()
        }
    }
    var weight: Float = 100.0 {
        didSet {
            setBmiValue()
        }
    }
    var bmi: BMI?

    mutating func setBmiValue() {
        let bmiValue = weight / (height * height)
        var advice: String
        var color: UIColor

        if bmiValue > 25 {
            advice = adviceList[2]
            color = .red
        } else if bmiValue > 18.5 {
            advice = adviceList[1]
            color = .blue
        } else {
            advice = adviceList[0]
            color = .green
        }

        bmi = BMI(value: bmiValue, advice: advice, color: color)
    }
}
