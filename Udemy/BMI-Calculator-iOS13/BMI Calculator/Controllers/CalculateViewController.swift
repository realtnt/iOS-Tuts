//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var calcButton: UIButton!

    var calculatorBrain = CalculatorBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        if sender.value > 0 {
            calculatorBrain.height = sender.value
            updateUI()
        } else {
            disableCalcButton()
        }
    }

    @IBAction func weightSliderChanged(_ sender: UISlider) {
        if sender.value > 0 {
            calculatorBrain.weight = sender.value
            updateUI()
        } else {
            calcButton.isEnabled = false
            calcButton.backgroundColor = .lightGray
        }
    }

    @IBAction func calculateButton(_ sender: UIButton) {
            self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.calculatorBrain = calculatorBrain
        }
    }

    func updateUI() {
        if !calcButton.isEnabled {
            calcButton.isEnabled = true
            calcButton.backgroundColor = .purple
        }
        heightLabel.text = String(format: "%.2f", calculatorBrain.height) + "m"
        weightLabel.text = String(format: "%.0f", calculatorBrain.weight) + "Kg"
    }

    func disableCalcButton() {
        calcButton.isEnabled = false
        calcButton.backgroundColor = .lightGray
    }
}

