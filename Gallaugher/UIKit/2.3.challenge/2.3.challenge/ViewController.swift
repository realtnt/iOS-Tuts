//
//  ViewController.swift
//  2.3.challenge
//
//  Created by Theo Ntogiakos on 20/09/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Howdy!"
        messageLabel.layer.borderWidth = 3
    }
    
    @IBAction func showMessageButton(_ sender: UIButton) {
        messageLabel.text = "You Are Awesome!"
        messageLabel.backgroundColor = .green
        messageLabel.layer.borderColor = CGColor.init(red: 1, green: 0, blue: 0, alpha: 1)
        messageLabel.textAlignment = .left
    }

    @IBAction func showAnotherMessageButton(_ sender: UIButton) {
        messageLabel.text = "You Are Great!"
        messageLabel.backgroundColor = .orange
        messageLabel.layer.borderColor = CGColor.init(red: 0, green: 1, blue: 0, alpha: 1)
        messageLabel.textAlignment = .right
    }
}

