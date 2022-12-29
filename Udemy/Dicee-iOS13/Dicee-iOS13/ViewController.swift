//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        randomizeDice()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        randomizeDice()
    }

    func randomizeDice() {
        var counter = 0
        let varTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true ) { (varTimer) in
            let diceImages = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
            self.diceImageView1.image = UIImage(imageLiteralResourceName: diceImages.randomElement()!)
            self.diceImageView2.image = UIImage(imageLiteralResourceName: diceImages.randomElement()!)
            counter += 1
            if counter == 15 {
                varTimer.invalidate()
            }
        }
    }
}

