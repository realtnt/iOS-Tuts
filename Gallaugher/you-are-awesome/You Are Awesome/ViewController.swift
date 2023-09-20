//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Theo Ntogiakos on 07/09/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.textColor = .green
        messageLabel.backgroundColor = .lightGray
        messageLabel.layer.borderColor = UIColor.red.cgColor
        messageLabel.layer.borderWidth = 2.0
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        print("🌞 Button pressed!")
        messageLabel.text = messageLabel.text!.isEmpty ? "You Are Awesome!" : ""
    }
}

