//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Ntogiakos, Theodoros on 31/12/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var calculatorBrain: CalculatorBrain?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    func updateUI() {
        bmiLabel.text = calculatorBrain?.bmi?.getBmi()
        adviceLabel.text = calculatorBrain?.bmi?.getAdvice()
        view.backgroundColor = calculatorBrain?.bmi?.getColor()
    }
}
