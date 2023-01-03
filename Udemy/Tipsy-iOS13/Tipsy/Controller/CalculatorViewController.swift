//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    
    var tipsyModel = TipsyModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        calcButton.isEnabled = false
        calcButton.backgroundColor = .lightGray
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tipsyModel.tipPercentage = 0
        }
        if sender.currentTitle == "10%" {
            tenPctButton.isSelected = true
            tipsyModel.tipPercentage = 10
        }
        if sender.currentTitle == "20%" {
            twentyPctButton.isSelected = true
            tipsyModel.tipPercentage = 20
        }
    }

    @IBAction func stepperValChanged(_ sender: UIStepper) {
        let splitBy = Int(sender.value)
        splitNumberLabel.text = String(splitBy)
        tipsyModel.splitBy = splitBy
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    @IBAction func billTextFieldChanged(_ sender: UITextField) {
        if billTextField.text!.isNumber {
            tipsyModel.billtotal = Double(billTextField.text!) ?? 0.0
            calcButton.isEnabled = true
            calcButton.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        } else {
            calcButton.isEnabled = false
            calcButton.backgroundColor = .lightGray
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipsyModel = tipsyModel
        }
    }
}

extension String {
    var isNumber: Bool {
        let characters = CharacterSet.decimalDigits

        return CharacterSet(charactersIn: self).isSubset(of: characters)
    }
}
