//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        sender.backgroundColor = quizBrain.check(sender.currentTitle!) ? .green : .red
        quizBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        self.questionLabel.text = quizBrain.getQuestionText()
        self.progressBar.progress = quizBrain.getProgress()
        self.choice1Button.setTitle(quizBrain.getChoiceText(1), for: .normal)
        self.choice2Button.setTitle(quizBrain.getChoiceText(2), for: .normal)
        self.choice3Button.setTitle(quizBrain.getChoiceText(3), for: .normal)
        self.choice1Button.backgroundColor = .clear
        self.choice2Button.backgroundColor = .clear
        self.choice3Button.backgroundColor = .clear
        self.scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
}

