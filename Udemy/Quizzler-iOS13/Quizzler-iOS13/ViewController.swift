//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

    let quiz = [
        QuizQuestion(questionText: "Four + Two is equal to Six", answer: true),
        QuizQuestion(questionText: "Five - Three is greater than One", answer: true),
        QuizQuestion(questionText: "Three + Eight is less than Ten", answer: false)
    ]

    var questionNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle == "True"

        print(
            quiz[questionNumber].check(userAnswer: userAnswer) ? "Correct!" : "WROOONG!"
            )

        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        updateUI()
    }

    func updateUI() {
        self.questionLabel.text = quiz[questionNumber].questionText
    }
}

struct QuizQuestion {
    let questionText: String
    let answer: Bool

    func check(userAnswer: Bool) -> Bool {
        return userAnswer == self.answer
    }
}
