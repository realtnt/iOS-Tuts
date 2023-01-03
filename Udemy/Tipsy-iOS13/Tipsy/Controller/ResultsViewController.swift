//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ntogiakos, Theodoros on 03/01/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    var tipsyModel: TipsyModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    func updateUI() {
        totalLabel.text = "£" + String(format: "%.2f", tipsyModel!.amountPerPerson)
        settingsLabel.text = "Split between \(tipsyModel!.splitBy) people, with \(tipsyModel!.tipPercentage)% tip."
    }
}
